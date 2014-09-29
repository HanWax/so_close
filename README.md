Team Mist - Makers Academy Final Project
========================================

Objectives
-----------
* To create an app that informs users as to whom they almost bumped in to on the previous day

Requirements
------------
To write a programme that:

* Gets users location data at a fine enough granularity. We did this using the Moves App API.
* Can compare two users' location data to ascertain as to whether they almost bumped in to each other.
* Allows users to sign in and out of their accounts.
* Only allows users to see their own bulletins
* Sends a daily bulleting to users informing them of their friends that they almost bumped in to
* Allows users to add and remove friends. Users' data should only be compared against that of their friends
* Is deployed to Heroku

Technical Configuration
-----------------------
* Ruby
* Ruby on Rails
* Postgresql
* RSpec
* Capybara
* HTML
* CSS
* JavaScript
* JQuery
* AJAX
* APIs: Moves
* Omniauth strategies: Facebook and Moves
* Heroku

Collaborators
--------------
* [Edward Andress](https://github.com/EdwardAndress)
* [Thomas Beeley](https://github.com/tbeeley)
* [Michiel Stigter](https://github.com/michielstigter)
* [Zoe Bryant](https://github.com/zoeabryant)
* [Charlie Redwood](https://github.com/M-E-T-H-O-Dman)
* [Hannah Waxman](https://github.com/HanWax)

How to use
-----------
1. Download the Moves App on your phone
2. Sign in to our app at just-mist.herokuapp.com, first through Facebook, and then by entering in the Moves PIN code in your Moves App.
3. Search for friends who are also using Team Mist's app and add them.
4. On the next day, check out the bulletins page to see whether you had any near misses.

My contribution
---------------
* I paired with [Michiel Stigter](https://github.com/michielstigter) and [Thomas Beeley](https://github.com/tbeeley) to work out how to take the data from the Moves App and integrate it into our Rails app
* I paired with [Michiel Stigter](https://github.com/michielstigter) on integrating the various omniauth logins into our app. We had two omniauth logins - first through Facebook and then through Moves
* I paired with [Charlie Redwood](https://github.com/M-E-T-H-O-Dman) to create a social network, where users could follow other users.
* I paired with [Edward Andress](https://github.com/EdwardAndress) to test-drive and write the timeline comparison algorithms.

Next steps
----------
* Use the Heroku add-on Scheduler to allow data to be fetched once every 24 hours
* Incorporate the Twilio API to send a text message to the user at 9am every morning with the bulletins informing them of their near misses
* Add a 'connect' feature, so that users can get in easily send a message to the friends who appear on their bulletin.