
weather_statement = (place, weather) ->

  generic_weathers = [
    "BE LOTS OF WEATHER HAPPENING",
    "BE AWESOME",
    "BE WEIRD"
  ]

  sunny_weathers = [
    'BE SUNNY ALL DAY',
    'BE UNSEASONABLY WARM',
    'BE VERY NICE OUT TODAY'
  ]

  cloudy_weathers = [
    'BE EXTREMELY CLOUDY',
    'BE CLOUDY AND GRAY',
    'BE DEPRESSINGLY CLOUDY'
    ]

  rainy_weathers = [
    'RAIN ALL DAY',
    'BE VERY RAINY',
    'RAIN LIKE THE DICKENS'
  ]

  winter_weathers = [
    'SNOW',
    'SNOW ALL DAY',
    'BE VERY SNOWY',
    'BE COLD',
    'BE EXTREMELY COLD',
    'BE UNSEASONABLY COLD'
  ]

  weathers = switch
    when weather == 'sunny' then sunny_weathers.concat(generic_weathers)
    when weather == 'cloudy' then cloudy_weathers.concat(generic_weathers)
    when weather == 'rainy' then rainy_weathers.concat(generic_weathers)
    when weather == 'winter' then winter_weathers.concat(generic_weathers)
    else generic_weathers

  weather1 = weathers[Math.floor(Math.random() * weathers.length)]
  weather2 = weathers[Math.floor(Math.random() * weathers.length)]

  generic_objects = [
    "AXE",
    "CELL PHONE",
    "WATER BOTTLES",
    "FLASHLIGHTS",
    "MULTI-TOOLS",
    "KNIFE",
    "EMERGENCY FOOD",
    "FIRST AID KIT",
    "COMPASS",
    "SLEEPING BAG",
    "CANTEEN",
    "MAPS",
    "SEWING KIT",
    "MAPS",
    "DUCT TAPE",
    "PLASTIC TUBING",
    "LIGHTER",
    "SPACE BLANKET",
    "CROWBAR",
    "SHOVEL",
    "HAM RADIO",
    "CB RADIO",
    "SIGNAL MIRROR",
    "FOUR SEASON TENT",
    "WHISTLE",
    "HIKING BOOTS",
    "BLEACH",
    "HAMMOCK",
    "HEAD-LAMP",
    "MACHETE",
    "GLOVES",
    "EXTRA SOCKS",
    "SALTS",
    "PONCHO",
    "RAIN SUIT",
    "BANDANA",
    "BIBLE",
    "TORAH",
    "PLAYING CARDS",
    "RIFLE",
    "SHOTGUN",
    "POINTY STICKS",
    "BOOM-A-RANG",
    "SLINGSHOT",
    "SURVIVAL LAPTOP",
    "SAW",
    "SUNGLASSES",
    "SUNSCREEN",
    "LANTERN",
    "JUMPER CABLES"
  ]

  sunny_objects = [
    'BATHING SUITS',
    'SUNSCREEN',
    'TUBE TOPS',
    'FLIPPY FLOPPYS',
    'FRISBEES',
    'SOCCER BALLS',
    'SUN GLASSES',
    'SHORT SHORTS',
    'BANANA HAMMOCK',
    'DAISY DUKES',
    'ROLLER BLADES',
    'SUN BLOCK'
  ]

  cloudy_objects = [
    'COFFEE',
    'VITAMIN D',
    'RED BULL ENERGY DRINK',
    'EXTRA LAYERS OF CLOTHING',
    'FLASHLIGHTS',
    'HOODED SWEATSHIRTS',
    'SWEATSHIRTS',
    'RADIO BOOSTERS',
    'DI-POLE ANTENNAS'
  ]

  rainy_objects = [
    'RAIN JACKETS',
    'UMBRELLAS',
    'RAIN GEAR',
    'WATERPROOF SHOES',
    'GALOSHES'
  ]

  winter_objects = [
    'SNOWSHOES',
    'WINTER JACKETS',
    'WOOLEN MITTENS',
    'TOQUES',
    'SCARVES',
    'HEAVY SWEATERS'
  ]

  objects = switch
    when weather == 'sunny' then sunny_objects.concat(generic_objects)
    when weather == 'cloudy' then cloudy_objects.concat(generic_objects)
    when weather == 'rainy' then rainy_objects.concat(generic_objects)
    when weather == 'winter' then winter_objects.concat(generic_objects)
    else generic_objects

  object1 = objects[Math.floor(Math.random() * objects.length)]
  object2 = objects[Math.floor(Math.random(objects.length) * objects.length)]

  foods = [
    'PIZZA',
    'BEER',
    'CHINESE FOOD',
    'BURRITOS',
    'PHO',
    'TACOS',
    'SCRAMBLED EGGS',
    'BAGELS',
    'PASTA WITH CREAMY SAUCE',
    'HOT DOGS',
    'FRIED CHICKEN',
    'WAFFLES',
    'HAMBURGERS',
    'CHILI-CHEESE FRIES',
    'BAKED POTATOES',
    'FALAFEL',
    'CUPCAKES',
    'BIRTHDAY CAKES'
  ]

  food1 = foods[Math.floor(Math.random() * foods.length)]
  food2 = foods[Math.floor(Math.random(foods.length) * foods.length)]

  message = "THIS IS FRANKIE MACDONALD REPORTING LIVE FROM SYDNEY NOVA SCOTIA! "
  message += "#{weather} IS HEADED FOR #{place}! "
  message += "IT'S GONNA #{weather1}!! IT'S GONNA #{weather2}!! "
  message += "HAVE YOUR #{object1} READY!! HAVE YOUR #{object2} READY!! "
  message += "ORDER YOUR #{food1} and #{food2} WHILE YOU STILL CAN!!"

init_google_api = (key) ->
  Maps = require 'googlemaps'

  publicConfig =
    key: key
    stagger_time:       1000
    encode_polylines:   false
    secure:             true
  

  gmApi = new Maps publicConfig

init_forecast_api = (key) ->
  Forecast = require 'forecast.io-bluebird'
  
  forecastConfig =
    key: key
  
  forcast = new Forecast forecastConfig

lat_lon_for_location = (api, location, weatherFn) ->
  geocodeParams =
    address: location

  api.geocode(
    geocodeParams
    (err, data) ->
      #Total hack because the callback isn't being handled properly and the data is filled in after its executed or something
      setTimeout(
        () ->
          if typeof data is 'object'
            location = data.results[0].geometry.location
            weatherFn(
              location.lat
              location.lng)
        100)

    )

map_weather_type = (weather) ->
  map = 
    'clear-day': 'sunny'
    'clear-night': 'sunny'
    'rain': 'rainy'
    'snow': 'winter'
    'sleet': 'winter'
    'wind': 'cloudy'
    'fog': 'cloudy'
    'cloudy': 'cloudy'
    'partly-cloudy-day': 'cloudy'
    'partly-cloudy-night': 'cloudy'


  condition = weather.currently.icon

  map[condition]


module.exports = (robot) ->
  config = require '../frankie-config.js'
  mapsApiKey = config.google.apiKey
  forecastApiKey = config.forecastIO.apiKey

  gmApi = init_google_api mapsApiKey

  forecastApi = init_forecast_api forecastApiKey

  robot.respond /weather (.*)$/i, (msg) ->
    weatherFn = (lat, lon) ->
      console.log lat
      console.log lon
      promise = forecastApi.fetch(
        lat
        lon)

      promise.then (result) ->
        weather_type = map_weather_type result
        msg.send weather_statement(
          msg.match[1]
          weather_type)
    
    lat_lon_for_location(
      gmApi
      msg.match[1]
      weatherFn)

  robot.respond /weather$/i, (msg) ->
    msg.send weather_statement "PORTLAND, OR"
