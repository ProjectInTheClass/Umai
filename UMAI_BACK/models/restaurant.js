const { Sequelize, DataTypes } = require("sequelize");

// 데이터베이스 연결 설정
const sequelize = new Sequelize("testDB", "root", "1234", {
  host: "localhost",
  dialect: "mysql",
});

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

(async () => {
  try {
    await sequelize.sync();
    console.log("Restaurant table has been created.");
  } catch (error) {
    console.error("Error creating table:", error);
  }
})();

module.exports = Restaurant;
