const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const app = express();
const path = require("path");
const User = require("./models/user.model");
const Build = require("./models/build.model");

app.use(cors());
mongoose.set("debug", true);
mongoose
  .connect(
    "mongodb+srv://coucou:coucou@cluster0.qdchu.mongodb.net/EldenBuild?retryWrites=true&w=majority",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }
  )
  .then(() => console.log("connexion ok !"));

app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());

// Get All Users
app.get("/api/users", async (req, res) => {
  try {
    const users = await User.find({}).exec();
    res.json(users);
  } catch (e) {
    res.status(500).json(e);
  }
});

// Get all build
app.get("/api/builds", async (req, res) => {
  try {
    const builds = await Build.find({}).exec();
    res.json(builds);
  } catch (e) {
    res.status(500).json(e);
  }
});

//Regiter new user
app.post("/api/register", async (req, res) => {
  try {
    const body = req.body;
    const user = await new User(body).save();
    res.json(user);
  } catch (e) {
    res.status(500).json(e);
  }
});

//Add new build
app.post("/api/new-build", async (req, res) => {
  try {
    const body = req.body;
    const build = await new Build(body).save();
    res.json(build);
  } catch (e) {
    res.status(500).json(e);
  }
});

app.listen(80);
