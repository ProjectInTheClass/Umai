const express = require("express");
const User = require("../models/user");
const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const users = await User.findAll();
    console.log("users:", users);
    res.json(users);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error fetching users", error: error.message });
  }
});

router.post("/setMbti", async (req, res) => {
  try {
    const { id, MBTI } = req.body;
    const user = await User.findOne({ where: { id } });
    if (!user) {
      res.status(404).json({ message: "User not found" });
      return;
    }
    user.MBTI = MBTI;
    await user.save();
    res.json({ message: "MBTI inserted successfully" });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error inserting MBTI", error: error.message });
  }
});

module.exports = router;
