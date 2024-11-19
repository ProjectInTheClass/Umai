const express = require("express");
const mysql = require("mysql2");

const User = require("./models/user");
const MBTI = require("./models/mbti");
const Restaurant = require("./models/restaurant");

const app = express();
const port = 3333;

app.get("/", async (req, res) => {
  try {
    // 데이터베이스에서 모든 레스토랑 정보를 가져옴
    const restaurants = await Restaurant.findAll();
    console.log(restaurants); // 결과 확인
    // main.ejs 파일로 렌더링, restaurants 데이터 전달
    res.render("main.ejs", { restaurants });
  } catch (error) {
    console.error("Error fetching restaurants:", error);
    res.status(500).send("Internal Server Error");
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
