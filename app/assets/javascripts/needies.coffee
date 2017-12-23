$('.needies.index, .needies.create').ready ()->
  options =
    {
      url: '/needies.json'
      latLng: {lat: 'needy_latitude', lng: 'needy_longitude'},
      field_complete: 'needy_address'      
    }
  mapper = new Mapper(options)
  # mapper.getLocation()