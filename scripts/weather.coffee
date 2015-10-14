
weather_statement (place) ->

  weather = "GET IT FROM FORECAST.IO?!"

  sunny_things = [
    'BE SUNNY ALL DAY',
    'BE UNSEASONABLY WARM',
    'BE VERY NICE OUT TODAY'
  ]

  cloudy_things = [
    'BE EXTREMELY CLOUDY',
    'BE CLOUDY AND GRAY',
    'BE DEPRESSINGLY CLOUDY'
    ]

  rainy_things = [
    'RAIN ALL DAY',
    'BE VERY RAINY',
    'RAIN LIKE THE DICKENS'
  ]

  winter_things = [
    'SNOW',
    'SNOW ALL DAY',
    'BE VERY SNOWY',
    'BE COLD',
    'BE EXTREMELY COLD',
    'BE UNSEASONABLY COLD'
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

  if weather <contains cloudy>
    things = cloudy_things
    objects = cloudy_objects

  if weather <contains sun>
    things = sunny_things
    objects = sunny_objects

  if weather <contains rain>
    things = rainy_things
    objects = rainy_objects

  if weather <contains snow>
    things = winter_things
    objects = winter_objects
  

  thing1 = things[Math.floor(Math.random() * array.length)]
  thing2 = things[Math.floor(Math.random() * array.length)]

  object1 = objects[Math.floor(Math.random() * array.length)]
  object2 = objects[Math.floor(Math.random() * array.length)]

  foods = [
    'PIZZA',
    'BEER',
    'CHINESE FOOD',
    'BURRITOS',
    'PHO',
    'TACOS',
    'SCRAMBLED EGGS’,
    ‘BAGELS’,
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

  food1 = foods[Math.floor(Math.random() * array.length)]
  food2 = foods[Math.floor(Math.random() * array.length)]

  message = "THIS IS FRANKIE MACDONALD REPORTING LIVE FROM SYDNEY NOVA SCOTIA! "
  message += "#{weather} IS HEADED FOR #{place}! "
  message += "IT'S GONNA #{thing1}!! IT'S GONNA #{thing2}!! "
  message += "HAVE YOUR #{object1} READY!! HAVE YOUR #{object1} READY!! "
  message += "ORDER YOUR #{food1} and #{food2} WHILE YOU STILL CAN!!"

module.exports = (robot) ->
  robot.respond /weather (.*)$/i, (msg) ->
    msg.send weather_statement(msg.match[1])

  robot.respond /weather$/i, (msg) ->
    msg.send weather_statement('PORTLAND, OR')
