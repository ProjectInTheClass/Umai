const { Sequelize, DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const User = sequelize.define("User", {
  user_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  id: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  MBTI: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  nickname: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

(async () => {
  try {
    await User.sync({ force: false });
    console.log("User table has been created.");
  } catch (error) {
    console.error("Error creating table:", error);
  }
})();

module.exports = User;
