# README

[![CircleCI](https://circleci.com/gh/amassaad/isthereparkingonyork.svg?style=svg)](https://circleci.com/gh/amassaad/isthereparkingonyork)

This is a Rails-based Foscam camera setter and image getter.

It uses a job in the background to update the camera position, and get images without delaying the main thread\s. Maybe, I haven't really looked at this code in a while so who knows how it works really.

* Ruby version: `2.4.0`

* System dependencies: Foscam camera, probably more? Redis for sure.

* Configuration: yep

* Database creation: nope!

* Services (job queues, cache servers, search engines, etc.)

