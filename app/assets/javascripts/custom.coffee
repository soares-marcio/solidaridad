$('.needies.index, .needies.create').ready ()->
  $('.button-collapse').sideNav();
  $('.parallax').parallax();
  
  mapper = new Mapper()
  mapper.initialize('/needies.json')
  # mapper.getLocation()