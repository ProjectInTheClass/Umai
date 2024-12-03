const Restaurant = require("./models/restaurant");

exports.getRestaurantById = (req, res, next) => {
  const restaurantId = req.params.restaurantId;
  Restaurant.findByPk(restaurantId)  // Use findByPk instead of findById
    .then((restaurant) => {
      if (restaurant) {
        res.status(200).json({
          message: "Fetched restaurant successfully.",
          restaurant: restaurant,
        });
      } else {
        res.status(404).json({
          message: "Restaurant not found",
        });
      }
    })
    .catch((error) => {
      console.log(error);
      res.status(500).json({ message: "Server error" });
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
      res.status(500).json({ message: "Server error" });
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
