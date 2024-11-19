const { Sequelize, DataTypes } = require("sequelize");

// 데이터베이스 연결 설정
const sequelize = new Sequelize("testDB", "root", "1234", {
  host: "localhost",
  dialect: "mysql",
});

const MBTI = sequelize.define("MBTI", {
  mbti_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  mbti_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  description: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

(async () => {
  try {
    await sequelize.sync();
    console.log("MBTI table has been created.");
  } catch (error) {
    console.error("Error creating table:", error);
  }
})();

module.exports = MBTI;
