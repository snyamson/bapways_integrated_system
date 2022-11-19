const express = require("express");
const createError = require("http-errors");
const morgan = require("morgan");
require("dotenv").config();

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(morgan("dev"));

app.get("/", async (req, res, next) => {
  res.send({ message: "Awesome it works" });
});

//TODO: CREATE API ROUTE
app.use(require("./routes/user"));
app.use(require("./routes/client"));
app.use(require("./routes/cocoa"));
app.use(require("./routes/officer"));
app.use(require("./routes/dashboard"));

app.use((req, res, next) => {
  next(createError.NotFound());
});

app.use((err, req, res, next) => {
  res.status(err.status || 500);
  res.send({
    status: err.status || 500,
    message: err.message,
  });
});

//CREATE SERVER
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`server started on port ${PORT}`));
