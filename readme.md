# Taylor's Kitty Cam

This was a simple weekend project. I wanted to create something with my new Raspberry Pi 2 and I had an old webcam lying around. After a  few hours of tinkering, and The Kitty Cam&#8482; was created.

### Notes

daemonize with forever: `forever start -c coffee cam.coffee`

create a `./webcam` directory to store the pictures

`fswebcam` actually takes the pictures: `fswebcam -r 640x480 test.jpg -S 10`

The MS Life Camera 500 takes a while to warm up, skip the first 10 frames.

Nginx proxies requests to /cam to the mini node server that actually takes the picture (`cam.coffee`).
