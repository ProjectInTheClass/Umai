const passport = require("passport");
const bcrypt = require("bcrypt");
const User = require("../models/user");

//isNotLoggedIn 미들웨어
exports.isNotLoggedIn = (req, res, next) => {
  if (!req.isAuthenticated()) {
    next();
  } else {
    res.status(403).send("이미 로그인되어 있습니다.");
  }
};

//로그인 미들웨어
exports.isLoggedIn = (req, res, next) => {
  if (req.isAuthenticated()) {
    next();
  } else {
    res.status(403).send("로그인이 필요합니다.");
  }
};
