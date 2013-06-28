mongoose = require "mongoose"
Schema = mongoose.Schema

CharacterSchema = new Schema
	
	name: 
		type: String,

	age: 
		type: Number,

	slogan:
		type: String

Character = module.exports = mongoose.model "Character", CharacterSchema 