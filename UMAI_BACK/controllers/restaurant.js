const Restaurant = require("../models/restaurant");

exports.getRestaurantById = (req, res, next) => {
  const restaurantId = req.params.restaurantId;
  Restaurant.findById(restaurantId)
    .then((restaurant) => {
      res.status(200).json({
        message: "Fetched restaurant successfully.",
        restaurant: restaurant,
      });
    })
    .catch((error) => {
      console.log(error);
    });
};

exports.createRestaurant = (req, res, next) => {
  const restaurant = new Restaurant({
    name: req.body.name,
    address: req.body.address,
    taste: req.body.taste,
    price: req.body.price,
    quantity: req.body.quantity,
    accessibility: req.body.accessibility,
    ambiance: req.body.ambiance,
    description: req.body.description,
  });
  restaurant
    .save()
    .then((result) => {
      res.status(201).json({
        message: "Restaurant created successfully!",
        restaurant: result,
      });
    })
    .catch((error) => {
      console.log(error);
    });
};

// exports.getRestaurantByMbti = (req, res, next) => {
//   const mbti = req.params.mbti;
//   Restaurant.find({ mbti: mbti })
//     .then((restaurants) => {
//       res.status(200).json({
//         message: "Fetched restaurants successfully.",
//         restaurants: restaurants,
//       });
//     })
//     .catch((error) => {
//       console.log(error);
//     });
// };
