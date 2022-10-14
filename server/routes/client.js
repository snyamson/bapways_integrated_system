const express = require("express");
const prisma = require("../client");

const clientRouter = express.Router();

clientRouter.get("/api/clients", async (req, res) => {
  try {
    const clients = await prisma.Client.findMany({
      include: { officer_name: true },
    });

    res.status(200).json(clients);
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error fetching all Clients, ${error.message}`,
      })
      .end();
  }
});

clientRouter.post("/api/clients", async (req, res) => {
  const { body } = req;

  try {
    const client = await prisma.Client.create({
      data: body,
    });
    res.status(200).json(client);
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error adding new Client, ${error.message}`,
      })
      .end();
  }
});

clientRouter.patch("/api/client/:id", async (req, res) => {
  const { body } = req;
  const { id } = req.params;

  try {
    const updateClient = await prisma.Client.update({
      where: {
        id: Number(id),
      },
      data: body,
    });
    res.status(200).json(updateClient);
  } catch (error) {
    res
      .status(400)
      .json({
        error: `There was an error updating Client, ${error.message}`,
      })
      .end();
  }
});

module.exports = clientRouter;
