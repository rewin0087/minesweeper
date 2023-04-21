# README

## Overview

- Rails version: 7
- Ruby version: 3.1.2
- node version: 14.21.2


## Setup

- Install `rbenv` reference: `https://github.com/rbenv/rbenv`
- Install `3.1.2 ruby` through `rbenv`
- Install `postgresql`
- Install `bundler`
- Run `bundle install`
- Install `nvm` reference: `https://github.com/nvm-sh/nvm`
- Install `v14.21.2 node` or higher through `nvm`
- Install `yarn`
- Run `yarn install`
- Run `bundle exec rake db:setup` to run migration and seed
- Run `rails s` or `bin/dev`
- Open browser `localhost:3000`


## Test

- Run `bundle exec rspec spec`

## App overview

- We are building a simple rails application that allows users to generate minesweeper boards as well as to view previously generatedminesweeper boards.
- When I visit the app’s root url, it should take me to a page that’s clearly labeled, where I am prompted to enter my email address, aboard width, a board height, the number of mines, and a board name.

There should be a button labeled “Generate Board”, that when pressed, it should:

- send a request to the server that generates the minesweeper board
- the generated minesweeper board should be stored in the database, along with the name of the board and the email ofwhomever generated the board
- once saved, it should redirect the user to a page where the name of the board, the email of the creator, and a visual of thegenerated minesweeper board is displayed (i.e. show action for the generated board).
  - The visual can be a simple xy plane that uses   for empty cells and   for cells that contain a mine


Note regarding the generator algorithm: The board generator algorithm is the main component of this coding challenge so makesure it works as expected. It should work in a performant manner for boards of any dimension so make sure to test boards of all sizeswhile you fine tune your algorithm. Lastly, the algorithm itself should return a two-dimensional array of objects that represent the state ofa minesweeper board before the game starts

Now, back at the home page, we should:

- add a labeled list for ten most recently generated boards
- Each list item should at the very least include the name of the board, the email of the user that generated the board, and thecreated at date (nicely formatted)
- The title of each board should be a link that when clicked, should direct the user to a page that shows said generated board
- Lastly, at the bottom of the list, we should have a link that reads “view all generated boards” that when clicked takes the userto a page that lists all of the boards generated by the app