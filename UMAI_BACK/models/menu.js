const { Sequelize, DataTypes } = require("sequelize");
const restaurant = require("./restaurant");

// 데이터베이스 연결 설정
const sequelize = new Sequelize("testDB", "root", "1234", {
  host: "localhost",
  dialect: "mysql",
});

const menu = sequelize.define("menu", {
  menu_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  restaurant_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    foriegnKey: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  cash: {
    type: DataTypes.INTEGER,
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
  createdAt: {
    type: DataTypes.DATE,
    defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
  },
  updatedAt: {
    type: DataTypes.DATE,
    defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
  },
});

//관계설정
menu.belongsTo(restaurant, {
  foreignKey: "restaurant_id",
  targetKey: "restaurant_id",
});

(async () => {
  try {
    await sequelize.sync();
    console.log("menu table has been created.");
  } catch (error) {
    console.error("Error creating table:", error);
  }
})();

module.exports = menu;
