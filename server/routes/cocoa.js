const express = require("express");
const prisma = require("../client");

const cocoaRouter = express.Router();

cocoaRouter.get("/api/cocoa-distribution", async (req, res) => {
  try {
    const entries = await prisma.Cocoa_distribution.findMany();

    res.status(200).json(entries);
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error fetching all entries, ${error.message}`,
      })
      .end();
  }
});

cocoaRouter.post("/api/cocoa-distribution", async (req, res) => {
  const { body } = req;

  try {
    const entry = await prisma.Cocoa_distribution.create({
      data: body,
    });
    res.status(200).json(entry);
  } catch (error) {
    res
      .status(400)
      .json({ error: `There was an error adding new entry, ${error.message}` })
      .end();
  }
});

cocoaRouter.patch("/api/cocoa-distribution/:id", async (req, res) => {
  const { body } = req;
  const { id } = req.params;

  try {
    const updateEntry = await prisma.Cocoa_distribution.update({
      where: {
        id: Number(id),
      },
      data: body,
    });
    res.status(200).json(updateEntry);
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error updating Entry, ${error.message}`,
      })
      .end();
  }
});

module.exports = cocoaRouter;
