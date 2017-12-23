$('.needies.index, .needies.create').ready ()->
  options =
    {
      url: '/needies.json'
      latLng: {lat: 'needy_latitude', lng: 'needy_longitude'},
      field_complete: 'needy_address',
      geolocation: false      
    }
  mapper = new Mapper(options)
