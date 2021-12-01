const mongoose = require('mongoose')

const menuSchema = new mongoose.Schema(
	{
		menu: {
			type: String,
			require: true,
		},
		name: {
			type: String,
			require: true,
		},
		description: {
			type: String,
			required: true,
		},
		calories: Number,
		price: {
			type: String,
			required: true,
		},
		owner: {
			type: mongoose.Schema.Types.ObjectId,
			ref: 'User',
			required: true,
		}
	},
	{
		timestamps: true,
	}
)

module.exports = mongoose.model('Menu', menuSchema)