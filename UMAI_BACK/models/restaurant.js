const { Sequelize, DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Restaurant = sequelize.define("Restaurant", {
  restaurant_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  address: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  menu: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  taste: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  price: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  quantity: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  accessibility: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  ambiance: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  description: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  foodImage: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  createdAt: {
    type: DataTypes.DATE,
    defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
  },
  updatedAt: {
    type: DataTypes.DATE,
    defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
  },
});

// 모델 동기화 (테이블 생성)aa
(async () => {
  try {
    // await sequelize.sync();
    // sequelize.sync({ force: true });
  } catch (error) {
    console.error("Error creating table:", error);
  }
})();

module.exports = Restaurant;
