$('.needies.index, .needies.create').ready ()->
  $('.button-collapse').sideNav();
  $('.parallax').parallax();
  
  mapper = new Mapper()
  mapper.getJSON('/needies.json')
  # mapper.getLocation()