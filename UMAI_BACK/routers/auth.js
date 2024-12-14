const express = require("express");
const passport = require("passport");
const bcrypt = require("bcrypt");
const router = express.Router();
const isNotLoggedIn = require("../middlewares/auth").isNotLoggedIn;
const isLoggedIn = require("../middlewares/auth").isLoggedIn;
const User = require("../models/user");
const jwt = require("jsonwebtoken");

const secretKey = "1234"; // 전역 상수로 관리

router.post("/join", isNotLoggedIn, async (req, res, next) => {
  console.log("회원가입 요청");
  const { id, password, user_name, nickname } = req.body; // 프론트에서 보낸 폼데이터를 받는다.

  try {
    // 기존에 이메일로 가입한 사람이 있나 검사 (중복 가입 방지)
    const exUser = await User.findOne({ where: { id } });
    if (exUser) {
      res.json({ message: "이미 가입된 이메일입니다." });
      return;
    }

    // 정상적인 회원가입 절차면 해시화
    const hash = await bcrypt.hash(password, 12);

    // DB에 해당 회원정보 생성
    try {
      await User.create({
        id,
        user_name,
        password: hash,
        nickname,
      });
      console.log("회원가입 완료");
    } catch (error) {
      console.error("Error saving data:", error);
      res.json({ message: "회원가입에 실패했습니다." });
      return;
    }
    // res.json({ message: "회원가입이 완료되었습니다." });
  } catch (error) {
    console.error(error);
    next(error);
  }
});

//* 로그인 요청
router.post("/login", isNotLoggedIn, async (req, res, next) => {
  console.log("로그인 요청");
  const { id, password } = req.body; // 로그인 폼에서 받은 데이터
  console.log("id : ", id);
  console.log("password : ", password);

  try {
    // 이메일을 기반으로 사용자 정보 찾기
    const user = await User.findOne({ where: { id } });

    if (!user) {
      // 이메일이 존재하지 않는 경우
      console.log("존재하지 않는 이메일입니다.");
      return res.json({ message: "존재하지 않는 이메일입니다." });
    }

    // 비밀번호 확인
    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
      // 비밀번호가 일치하지 않는 경우
      console.log("비밀번호가 일치하지 않습니다.");
      return res.json({ message: "비밀번호가 일치하지 않습니다." });
    }

    // 로그인 성공 시, JWT 토큰 생성
    const token = jwt.sign(
      { id: user.id, user_name: user.user_name }, // 페이로드: 사용자 정보
      "1234", // 비밀 키
      { expiresIn: "1h" } // 토큰 만료 시간 (예: 1시간)
    );

    // 로그인 성공 후 토큰과 사용자 정보를 응답으로 보내기
    console.log("로그인 성공");
    console.log("user : ", user);

    return res.json({
      message: "로그인 성공",
      token, // 생성한 JWT 토큰 반환
      user: {
        id: user.id,
        user_name: user.user_name,
        nickname: user.nickname,
      },
    });
  } catch (error) {
    console.error(error);
    next(error);
  }
});

//* 로그아웃 (isLoggedIn 상태일 경우)
router.get("/logout", isLoggedIn, (req, res) => {
  // console.log("로그아웃 요청");
  // req.user (사용자 정보가 안에 들어있다. 당연히 로그인되어있으니 로그아웃하려는 거니까)
  req.logOut((err) => {
    if (err) {
      return next(err);
    } else {
      req.session.destroy(); // 로그인인증 수단으로 사용한 세션쿠키를 지우고 파괴한다. 세션쿠키가 없다는 말은 즉 로그아웃 인 말.
      // console.log("로그아웃됨.");
    }
  });
  // res.redirect("/");
});

// 토큰 검증 미들웨어
const verifyToken = (req, res, next) => {
  const token = req.headers.authorization?.split(" ")[1]; // Bearer 토큰에서 실제 토큰만 추출

  if (!token) {
    return res.status(401).json({ message: "토큰이 없습니다." });
  }

  try {
    const decoded = jwt.verify(token, "1234"); // 토큰 검증
    req.user = decoded; // 검증 성공 시, 사용자 정보를 req에 추가
    next();
  } catch (err) {
    console.error("JWT 검증 실패: ", err);
    return res.status(401).json({ message: "유효하지 않은 토큰입니다." });
  }
};

router.get("/me", verifyToken, async (req, res) => {
  try {
    const user = await User.findOne({
      where: { id: req.user.id }, // JWT 페이로드에서 가져온 사용자 ID로 데이터 조회
    });

    console.log("user : ", user);

    if (!user) {
      return res.status(404).json({ message: "사용자를 찾을 수 없습니다." });
    }

    // 사용자 정보 반환
    res.json({
      id: user.id,
      user_name: user.user_name,
      nickname: user.nickname,
      MBTI: user.MBTI,
      matBTI: user.matBTI,
      favor: user.favor,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "서버 오류" });
  }
});

module.exports = router;
