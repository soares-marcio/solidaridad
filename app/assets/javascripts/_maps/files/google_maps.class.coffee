class window.Mapper
  self = null
  constructor: (options)->
    self = @
    @opts = options
    @markers = []
    @url = @opts.url
    @lat = @opts.latLng.lat
    @lng = @opts.latLng.lng
    @icon = '/images/icon.png'
    @optionsMarkerClusterer = { gridSize: 50, maxZoom: 15, imagePath: '/images/m'}
    @fieldAutoComplete = document.getElementById(@opts.field_complete)
    @zoom = 
      initialView: 15
      closeView: 18
    @location = {lat: -23.5505, lng: -46.6333}
    @myLatLng = new google.maps.LatLng(@location.lat, @location.lng)
    @mapOptions = 
      zoom: @zoom.initialView,
      center: @myLatLng,
      minZoom: 3,
      maxZoom: 18,
      styles: [
        {
          "featureType": "poi",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        }
      ]
    @map = new google.maps.Map(document.getElementById('map'), @mapOptions)
    @infoWindow = new google.maps.InfoWindow()
    @autocomplete = new google.maps.places.Autocomplete((self.fieldAutoComplete),{types: ['geocode'], placeholder: null})
    @map.setCenter(@location)
    @markers = []
    @needies = []
    self.initialize()
  initialize: ()->
    self.getJSON()
    self.autocomplete.addListener('place_changed', self.fillInAddress);

    if self.opts.geolocation
      self.getLocation()
      
  getJSON: (url)->
    $.getJSON url, (data)->
      $.each data, (i, e)->
        self.addMarkers(e)
        return
      new MarkerClusterer(self.map, self.markers, self.optionsMarkerClusterer);
    return

  getLocation: ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition (position)->
        pos = {lat: position.coords.latitude, lng: position.coords.longitude}
        self.map.setCenter(pos)
      , ()->
          self.handleLocationError(true, self.infoWindow, self.map.getCenter(self.location))
    else
      self.handleLocationError(false, self.infoWindow, self.map.getCenter(self.location))

  addMarker: (needy, location)->
    marker = new google.maps.Marker(
      position: location,
      title: needy.address,
      map: self.map,
      icon: self.icon
    )
    details = self.setPopUp(needy)
    self.bindInfoWindow(marker, self.map, self.infoWindow, details)
    self.markers.push(marker)
    
    google.maps.event.addListener marker, 'click', ->
      # @map.setZoom self.zoom.closeView
      self.map.panTo marker.getPosition()
      self.smoothZoom(self.map, self.zoom.closeView, self.map.getZoom())
      return
    return
  smoothZoom: (map, max, cnt)->
    if cnt >= max
      return
    else
      zoom = google.maps.event.addListener map, 'zoom_changed', (event)->
              google.maps.event.removeListener(zoom)
              self.smoothZoom(map, max, (cnt + 1))
              return
      setTimeout -> 
        map.setZoom(cnt)
        return
      , 40
    return
  addMarkers: (needy)->
    if needy.latitude and needy.longitude
      position = new google.maps.LatLng needy.latitude, needy.longitude
      address = "#{needy.address}"
      self.addMarker needy, position

  drawMarkers: (map)->
    $.each self.markers, (marker)->
      marker.setMap map

  showMarkers: ->
    self.setAllMap self.map

  setAllMap: (map)->
    i = 0
    while i < @markers.length
      @markers[i].setMap map
      i++
  setPopUp: (needy)->
    content = '<div class="col s 12 box-needy">'
    content = content.concat('<strong>Endereço</strong>:&nbsp;'+needy.address+'<br>')
    content = content.concat('<strong>Latitude</strong>:&nbsp;'+needy.latitude+'<br>')
    content = content.concat('<strong>Longitude</strong>:&nbsp;'+needy.longitude+'<br>')
    if needy.name
      content = content.concat('<strong>Nome</strong>:&nbsp;'+needy.name+'<br>')
    if Number(needy.quantity_person) > 0
      content = content.concat('<strong>Quantidade de Pessoas</strong>:&nbsp;'+needy.quantity_person+'<br>')
    if needy.description
      content = content.concat('<strong>Descrição</strong>:&nbsp;'+needy.description+'<br>')
    if needy.categories.length > 0
      console.log needy.categories
      content = content.concat('<strong>Necessidades imediatas</strong>:&nbsp;'+(needy.categories.map (category)-> category.name).join(', ')+'<br>')
    content = content.concat('</div>')
    content
  bindInfoWindow: (marker, map, infowindow, details)->
    google.maps.event.addListener marker, 'click', (e)->
      if(!marker.open)
        infowindow.setContent(details);
        infowindow.open(map, marker);
      else
        infowindow.close();
        marker.open = false;
      google.maps.event.addListener map, 'click', (e)->
        infowindow.close();
        marker.open = false;
    google.maps.event.addListener marker, 'mouseover', ()->
      infowindow.setContent(details);
      infowindow.open(map, marker)
    google.maps.event.addListener map, 'click', (e)->
      infowindow.close();
      marker.open = false;      
  fillInAddress: ->
    place = self.autocomplete.getPlace()
    document.getElementById(self.lat).value = place.geometry.location.lat()
    document.getElementById(self.lng).value = place.geometry.location.lng()    
  hideMarkers: ->
    self.setAllMap null

  latlng: (data)->
    if(Number(data.lat) && Number(data.lng))
      return new google.maps.LatLng(data.lat, data.lng);
    return null;

  removeListeners: ->
    _.each markers, (marker) ->
      google.maps.event.clearInstanceListeners(marker)

  deleteMarkers: ->
    @hideMarkers()
    @removeListeners()
    markers = []
  handleLocationError: (browserHasGeolocation, infoWindow, pos) ->
    if infoWindow
      infoWindow.setPosition(pos)
      infoWindow.setContent(browserHasGeolocation ? "Erro: O serviço de Geolocalização falhou." : "Erro: Seu navegador não suporta geolocalização.")
