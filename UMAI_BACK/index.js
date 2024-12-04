const express = require("express");
const cors = require("cors");
const app = express();
const Restaurant = require("./models/restaurant"); // Import the Restaurant model
const restaurantRouter = require("./routers/restaurant"); // Import the restaurant routes
const User = require("./models/user"); // Import the User model
const passport = require("passport");
const passportConfig = require("./passport");
const authRouter = require("./routers/auth"); // 인증 라우터
const cookieParser = require("cookie-parser");
const session = require("express-session");

const sequelize = require("./config/db");

sequelize
  .sync({ force: false })
  .then(() => {
    console.log("Database synced!");
  })
  .catch((error) => {
    console.error("Error syncing database:", error);
  });

//바디 잘 묶어서 보내줌
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

passportConfig(); // 패스포트 설정
app.use(cookieParser("12"));
app.use(
  session({
    resave: false,
    saveUninitialized: false,
    secret: process.env.COOKIE_SECRET,
    cookie: {
      httpOnly: true,
      secure: false,
    },
  })
);
//! express-session에 의존하므로 뒤에 위치해야 함
app.use(passport.initialize()); // 요청 객체에 passport 설정을 심음
app.use(passport.session()); // req.session 객체에 passport정보를 추가 저장
// passport.session()이 실행되면, 세션쿠키 정보를 바탕으로 해서 passport/index.js의 deserializeUser()가 실행하게 한다.

// Middleware
app.use(cors());
app.use(express.json()); // To parse incoming JSON requests
app.set("view engine", "ejs"); // Set view engine to EJS

// Routes
app.use("/api/restaurants", restaurantRouter);
app.use("/auth", require("./routers/auth"));

// Test route to check if server is working
app.get("/", (req, res) => {
  res.render("main.ejs");
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
