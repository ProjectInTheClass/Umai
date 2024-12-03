const { Sequelize, DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Menu = sequelize.define("Menu", {
  menu_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  price: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});

// 모델 동기화 (테이블 생성)
(async () => {
  try {
    await sequelize.sync();
    sequelize.sync({ force: true });
  } catch (error) {
    console.error("Error creating table:", error);
  }
})();

module.exports = Menu;
