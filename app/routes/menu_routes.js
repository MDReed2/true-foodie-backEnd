// Express docs: http://expressjs.com/en/api.html
const express = require('express')
// Passport docs: http://www.passportjs.org/docs/
const passport = require('passport')

// pull in Mongoose model for menus
const Menu = require('../models/menu')

// this is a collection of methods that help us detect situations when we need
// to throw a custom error
const customErrors = require('../../lib/custom_errors')

// we'll use this function to send 404 when non-existant document is requested
const handle404 = customErrors.handle404
// we'll use this function to send 401 when a user tries to modify a resource
// that's owned by someone else
const requireOwnership = customErrors.requireOwnership

// this is middleware that will remove blank fields from `req.body`, e.g.
// { menu: { title: '', text: 'foo' } } -> { menu: { text: 'foo' } }
const removeBlanks = require('../../lib/remove_blank_fields')
// passing this as a second argument to `router.<verb>` will make it
// so that a token MUST be passed for that route to be available
// it will also set `req.user`
const requireToken = passport.authenticate('bearer', { session: false })

// instantiate a router (mini app that only handles routes)
const router = express.Router()

// INDEX
// GET /menu
router.get('/menus', requireToken, (req, res, next) => {
	Menu.find()
		// respond with status 200 and JSON of the menu
		.then((menus) => res.status(200).json({ menus: menus }))
		// if an error occurs, pass it to the handler
		.catch(next)
})

// SHOW
// GET /menu/5a7db6c74d55bc51bdf39793
router.get('/menus/:id', requireToken, (req, res, next) => {
	// req.params.id will be set based on the `:id` in the route
	Menu.findById(req.params.id)
		.then(handle404)
		// if `findById` is successful, respond with 200 and "menu" JSON
		.then((menu) => res.status(200).json({ menu: menu }))
		// if an error occurs, pass it to the handler
		.catch(next)
})

// CREATE
// POST /menu
router.post('/menu', requireToken, (req, res, next) => {
	// set owner of new menu to be current user
	req.body.menu.owner = req.user.id

	Menu.create(req.body.menu)
		// respond to successful `create` with status 201 and JSON of new "menu"
		.then((menu) => {
			res.status(201).json({ menu })
		})
		// if an error occurs, pass it off to our error handler
		// the error handler needs the error message and the `res` object so that it
		// can send an error message back to the client
		.catch(next)
})

// UPDATE
// PATCH /menus/5a7db6c74d55bc51bdf39793
router.patch('/menu/:id', requireToken, removeBlanks, (req, res, next) => {
	// if the client attempts to change the `owner` property by including a new
	// owner, prevent that by deleting that key/value pair
	delete req.body.menu.owner

	Menu.findById(req.params.id)
		.then(handle404)
		// ensure the signed in user (req.user.id) is the same as the menu's owner (menu.owner)
		.then((menu) => requireOwnership(req, menu))
		// updating menu object with menuData
		.then((menu) => menu.updateOne(req.body.menu))
		// if that succeeded, return 204 and no JSON
		.then(() => res.sendStatus(204))
		// if an error occurs, pass it to the handler
		.catch(next)
})

// DESTROY
// DELETE /menu/5a7db6c74d55bc51bdf39793
router.delete('/menu/:id', requireToken, (req, res, next) => {
	Menu.findById(req.params.id)
		.then(handle404)
		// ensure the signed in user (req.user.id) is the same as the menu's owner (menu.owner)
		.then((menu) => requireOwnership(req, menu))
		// delete menu from mongodb
		.then((menu) => menu.deleteOne())
		// send back 204 and no content if the deletion succeeded
		.then(() => res.sendStatus(204))
		// if an error occurs, pass it to the handler
		.catch(next)
})

module.exports = router
