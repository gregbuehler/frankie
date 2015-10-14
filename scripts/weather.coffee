
weather_statement = (place) ->

  weather = "GET IT FROM FORECAST.IO?!"

  things = [
    "FOO",
    "BAR"
  ]

  thing1 = things[Math.floor(Math.random() * things.length)]
  thing2 = things[Math.floor(Math.random() * things.length)]

  objects = [
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

  object1 = objects[Math.floor(Math.random() * objects.length)]
  object2 = objects[Math.floor(Math.random(objects.length) * objects.length)]

  foods = [
    "PIZZA",
    "BEER",
    "CHINESE",
    "BURRITOS",
    "PHO",
    "TACOS",
    "SCRAMBLED EGGS"
  ]

  food1 = foods[Math.floor(Math.random() * foods.length)]
  food2 = foods[Math.floor(Math.random(foods.length) * foods.length)]

  message = "THIS IS FRANKIE MACDONALD LIVE FROM NOVA SCOTIA! "
  message += "#{weather} IS HEADED FOR #{place}! "
  message += "IT'S GONNA #{thing1}!! IT'S GONNA #{thing2}!! "
  message += "HAVE YOUR #{object1} READY!! HAVE YOUR #{object2} READY!! "
  message += "ORDER YOUR #{food1} and #{food2} WHILE YOU STILL CAN!!"

module.exports = (robot) ->
  robot.respond /weather (.*)$/i, (msg) ->
    msg.send weather_statement msg.match[1]

  robot.respond /weather$/i, (msg) ->
    msg.send weather_statement "PORTLAND, OR"
