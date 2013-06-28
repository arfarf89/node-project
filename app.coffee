express = require "express"
colors = require "colors"
cons = require "consolidate"
Character = require "./models/Character"

mongoose = require "mongoose"
mongoose.connect "mongodb://localhost/test"

db = mongoose.connection
db.on "error", console.error.bind(console, 'connection error:')
db.once "open", ->
	console.log "YAY! DB connected!".red

	december = new Character
		name: "December Jenkins"
		age: "24"
		slogan: "Wake me up when December comes!"

	december.save (err, december) ->
		console.log "#{december.name} successfully added.".green

	mary = new Character
		name: "Mary Smith"
		age: "7"
		slogan: "Mary Christmas ;)"

	mary.save (err, mary) ->
		console.log "#{mary.name} successfully added.".green

	spongebob = new Character
		name: "Spongebob Squarepants"
		age: "11"
		slogan: "Who lives in a pineapple under the sea?"

	spongebob.save (err, spongebob) ->
		console.log "#{spongebob.name} successfully added.".green

app = express()

# Template setup
app.engine "html", cons.swig
app.set "view engine", "html"
app.set "views", __dirname + "/views"

app.set "title", "Legendary!"

app.get "/", (req, res)->
	Character.find (err, characters) ->
		if err
			console.log err
		else
			console.log characters
			res.render "main.html", {characters: characters}

app.listen 3000

console.log "Listening on port 3000".yellow