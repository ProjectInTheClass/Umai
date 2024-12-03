const express = require('express');
const Restaurant = require('../models/restaurant'); 
const router = express.Router();

// GET request to fetch all restaurants
router.get('/', async (req, res) => {
  try {
    const restaurants = await Restaurant.findAll();
    res.json(restaurants);
  } catch (error) {
    res.status(500).json({ message: 'Error fetching restaurants', error: error.message });
  }
});

module.exports = router;