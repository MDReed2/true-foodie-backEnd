const mongoose = require('mongoose')

const menuSchema = new mongoose.Schema({
  name: {
    type: String,
    require: true,
  },
  ingredients: {
    type: [String],
    required: true,
  },
  calories: Number
})

module.export = mongoose.model('Menu', menuSchema)