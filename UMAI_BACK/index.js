const express = require("express");
const cors = require("cors");
const app = express();
const Restaurant = require("./models/restaurant"); // Import the Restaurant model
const restaurantRouter = require("./routers/restaurant"); // Import the restaurant routes
const User = require("./models/user"); // Import the User model

const sequelize = require("./config/db");

sequelize
  .sync({ force: false })
  .then(() => {
    console.log("Database synced!");
  })
  .catch((error) => {
    console.error("Error syncing database:", error);
  });

// Middleware
app.use(cors());
app.use(express.json()); // To parse incoming JSON requests
app.set("view engine", "ejs"); // Set view engine to EJS

// Routes
app.use("/api/restaurants", restaurantRouter);

// Test route to check if server is working
app.get("/", (req, res) => {
  res.send("Backend is working!");
});

// Sync Sequelize models with the database
Restaurant.sync({ force: false }) // force: false means it won’t drop existing tables
  .then(() => {
    console.log("Restaurant model synced with the database");
  })
  .catch((error) => {
    console.error("Error syncing the model:", error);
  });

// Start the server
const PORT = 3333;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
