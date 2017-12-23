class window.Mapper
  self = null
  constructor: (mapped)->
    @markers = []
    self = @
    @url = null
    @zoom = 
      initialView: 15
      closeView: 18
    @location = {lat: -23.5505, lng: -46.6333}
    @myLatLng = new google.maps.LatLng(@location.lat, @location.lng)
    @mapOptions = 
      zoom: @zoom.initialView
      center: @myLatLng
    @map = new google.maps.Map(document.getElementById('map'), @mapOptions)
    @infoWindow = new google.maps.InfoWindow()
    @map.setCenter(@location)
    @markers = []
    @needies = []
  initialize: (url)->
    self.getJSON(url)

  getJSON: (url)->
    $.getJSON url, (data)->
      $.each data, (i, e)->
        self.addMarkers(e)
        return
      return
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
      map: self.map
    )
    details = self.setPopUp(needy)
    self.bindInfoWindow(marker, self.map, self.infoWindow, details)
    self.markers.push(marker)
    google.maps.event.addListener marker, 'click', ->
      @map.setZoom self.zoom.closeView
      @map.setCenter marker.getPosition()

  addMarkers: (needy)->
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
    content = new String()
    content = content.concat("<strong>Endereço</strong>: " + needy.address + "<br>")
    content = content.concat("<strong>Latitude</strong>: " + needy.latitude + "<br>")
    content = content.concat("<strong>Longitude</strong>: " + needy.longitude + "<br>")
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
