
weather_statement = (place) ->

  weather = "GET IT FROM FORECAST.IO?!"

  generic_things = [
    "FOO",
    "BAR"
  ]

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

  things = switch
    when weather == 'sunny' then sunny_things
    when weather == 'cloudy' then cloudy_things
    when weather == 'rainy' then rainy_things
    when weather == 'winter' then winter_things
    else generic_things

  thing1 = things[Math.floor(Math.random() * things.length)]
  thing2 = things[Math.floor(Math.random() * things.length)]

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
    when weather == 'sunny' then sunny_objects
    when weather == 'cloudy' then cloudy_objects
    when weather == 'rainy' then rainy_objects
    when weather == 'winter' then winter_objects
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
  message += "IT'S GONNA #{thing1}!! IT'S GONNA #{thing2}!! "
  message += "HAVE YOUR #{object1} READY!! HAVE YOUR #{object2} READY!! "
  message += "ORDER YOUR #{food1} and #{food2} WHILE YOU STILL CAN!!"

module.exports = (robot) ->
  robot.respond /weather (.*)$/i, (msg) ->
    msg.send weather_statement msg.match[1]

  robot.respond /weather$/i, (msg) ->
    msg.send weather_statement "PORTLAND, OR"
