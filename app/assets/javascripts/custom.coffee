$('.needies.index, .needies.create').ready ()->
  $('.button-collapse').sideNav();
  $('.parallax').parallax();
  
  mapper = new Mapper()
  options =
    {
      url: '/needies.json'
      latLng: {lat: 'needy_latitude', lng: 'needy_longitude'}
    }
  mapper.initialize(options)
  # mapper.getLocation()