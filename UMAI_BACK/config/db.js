const { Sequelize } = require("sequelize");

const sequelize = new Sequelize("testDB", "root", "1234", {
  host: "127.0.0.1",
  dialect: "mysql",
  port: 3306,
  logging: false,
  dialectOptions: {
    connectTimeout: 60000, // Give enough time to connect
  },
});

// Ensure that the connection works
sequelize
  .authenticate()
  .then(() => console.log("Database connection established successfully"))
  .catch((err) => console.error("Unable to connect to the database:", err));

module.exports = sequelize;
