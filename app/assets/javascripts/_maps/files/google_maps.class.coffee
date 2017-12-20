class window.Mapper
  self = null
  constructor: (mapped)->
    @markers = []
    self = @
    @zoom = 
      initialView: 15
      closeView: 18
    @location = {lat: -23.5505, lng: -46.6333}
    @myLatLng = new google.maps.LatLng(@location.lat, @location.lng)
    @mapOptions = 
      zoom: @zoom.initialView
      center: @myLatLng
    @map = new google.maps.Map(document.getElementById('map'), @mapOptions)
    @infoWindow = null
    @map.setCenter(@location)
    @needies = []
    @markers = []
  getJSON: (url)->
    $.getJSON url, (data)->
      $.each data, (i, e)->
        console.log e
        self.needies.push(e)    
  getLocation: ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition (position)->
        pos = {lat: position.coords.latitude, lng: position.coords.longitude}
        self.map.setCenter(pos)
      , ()->
          self.handleLocationError(true, self.infoWindow, self.map.getCenter(self.location))
    else
      self.handleLocationError(false, self.infoWindow, self.map.getCenter(self.location))
  addMarker: (location, title)->
    marker = new google.maps.Marker(
      position: location,
      title: title,
      map: self.map
    )
    markers.push marker
    google.maps.event.addListener marker, 'click', ->
      @map.setZoom self.zoom.closeView
      @map.setCenter marker.getPosition()

  addMarkers: ->
    _.each self.needies, (marker) =>
      position = new google.maps.LatLng marker['latitude'], marker['longitude']
      title = "#{marker['address']}"
      self.addMarker position, title

  drawMarkers: (map)->
    _.each markers, (marker)->
      marker.setMap map

  showMarkers: ->
    self.setAllMap self.map

  setAllMap: (map)->
    i = 0
    while i < @markers.length
      @markers[i].setMap map
      i++

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
