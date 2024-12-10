const { Sequelize } = require("sequelize");

const sequelize = new Sequelize("umaiDB", "jintea", "1234", {
  host: "16.171.1.190",
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
