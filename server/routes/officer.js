const express = require("express");
const prisma = require("../client");

const officerRouter = express.Router();

officerRouter.get("/api/officers", async (req, res) => {
  try {
    const officers = await prisma.Officer.findMany();

    res.status(200).json(officers);
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error fetching all Officers, ${error.message}`,
      })
      .end();
  }
});

officerRouter.post("/api/officers", async (req, res) => {
  const { body } = req;

  try {
    const officer = await prisma.Officer.create({
      data: body,
    });
    res.status(200).json(officer);
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error adding new Officer, ${error.message}`,
      })
      .end();
  }
});

officerRouter.patch("/api/officer/:id", async (req, res) => {
  const { body } = req;
  const { id } = req.params;

  try {
    const updateOfficer = await prisma.Officer.update({
      where: {
        id: Number(id),
      },
      data: body,
    });
    res.status(200).json(updateOfficer);
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error updating Officer, ${error.message}`,
      })
      .end();
  }
});

module.exports = officerRouter;
