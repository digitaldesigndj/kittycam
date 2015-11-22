Hapi = require 'hapi'
child_process = require 'child_process'
spawn = child_process.spawn

server = new Hapi.Server()
server.connection port: 3000

server.route
  method: 'GET'
  path: '/cam'
  handler: ( request, reply ) ->
    console.log 'Frame Capture Initiated'
    time = new Date()
    timeString = time + ''
    stamp = timeString.replace ' ', '_'
    captureFrame = spawn 'fswebcam' , [
      '-r'
      '640x480'
      '/var/www/liv.hyprtxt.com/webcam/' + stamp + '.jpg'
      '-S'
      '10'
    ]
    captureFrame.on 'close', ( code ) ->
      reply.redirect 'http://liv.hyprtxt.com/webcam/' + stamp + '.jpg'

server.start ->
  console.log 'Server running at:', server.info.uri
