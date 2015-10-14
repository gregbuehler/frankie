
weather_statement (place) ->

  weather = "GET IT FROM FORECAST.IO?!"

  things = [
    'FOO',
    'BAR'
  ]

  thing1 = things[Math.floor(Math.random() * array.length)]
  thing2 = things[Math.floor(Math.random() * array.length)]

  objects = [
    'FOO',
    'BAR'
  ]

  object1 = objects[Math.floor(Math.random() * array.length)]
  object2 = objects[Math.floor(Math.random() * array.length)]

  foods = [
    'PIZZA',
    'BEER',
    'CHINESE',
    'BURRITOS',
    'PHO',
    'TACOS',
    'SCRAMBLED EGGS'
  ]

  food1 = foods[Math.floor(Math.random() * array.length)]
  food2 = foods[Math.floor(Math.random() * array.length)]

  message = "THIS IS FRANKIE MACDONALD LIVE FROM NOVA SCOTIA! "
  message += "#{weather} IS HEADED FOR #{place}! "
  message += "IT'S GONNA #{thing1}!! IT'S GONNA #{thing2}!! "
  message += "HAVE YOUR #{object1} READY!! HAVE YOUR #{object1} READY!! "
  message += "ORDER YOUR #{food1} and #{food1} WHILE YOU STILL CAN!!"

module.exports = (robot) ->
  robot.respond /weather (.*)$/i, (msg) ->
    msg.send weather_statement(msg.match[1])

  robot.respond /weather$/i, (msg) ->
    msg.send weather_statement('PORTLAND, OR')
