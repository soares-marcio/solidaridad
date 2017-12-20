$('.needies.index').ready ()->
  class Mapper
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
      
    getLocation: ->
      if navigator.geolocation
        navigator.geolocation.getCurrentPosition (position)->
          self.map.setCenter({lat: position.coords.latitude, lng: position.coords.longitude})
        , ()->
            handleLocationError(true, self.infoWindow, map.getCenter())
      else
        handleLocationError(false, self.infoWindow, map.getCenter())
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

    addMarkers: (markerList)->
      _.each markerList, (marker) =>
        position = new google.maps.LatLng marker['lat'], marker['lng']
        title = "#{marker['full_address']}"
        self.addMarker position, title

    drawMarkers: (map)->
      _.each markers, (marker)->
        marker.setMap map

    showMarkers: ->
      self.setAllMap self.map

    hideMarkers: ->
      self.setAllMap null

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
  mapper = new Mapper()
  mapper.getLocation()
