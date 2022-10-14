const express = require("express");

const userRouter = express.Router();

userRouter.get("/api/user", (req, res) => {
  res.send({ message: "user router" });
});

module.exports = userRouter;
