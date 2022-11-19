const express = require("express");
const prisma = require("../client");

const dashboardRouter = express.Router();

dashboardRouter.get("/api/dashboard", async (req, res) => {
  try {
    const clients = await prisma.Client.count();
    const clientsWithCount = await prisma.Client.groupBy({
      by: ["officerId"],
      _count: {
        id: true,
        _all: true,
      },
    });
    const cocoaEntries = await prisma.Cocoa_distribution.count();
    const officers = await prisma.Officer.count();

    res.status(200).json({
      officers: officers,
      clients: clients,
      cocoaEntries: cocoaEntries,
      clientsWithCount: clientsWithCount,
    });
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error fetching all Clients, ${error.message}`,
      })
      .end();
  }
});

module.exports = dashboardRouter;
