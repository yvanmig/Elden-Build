const express = require("express");
const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const cors = require("cors");
const app = express();
const path = require("path");
const User = require("./models/user.model");
const Build = require("./models/build.model");
const e = require("express");
const jwt = require('jsonwebtoken');

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
  bcrypt.hash(req.body.pass, 10)
  .then(hash => {
    const user = new User({
      email: req.body.email,
      pass: hash,
      bio: req.body.bio,
      pseudo: req.body.pseudo,
      photo: " "
    });
    user.save()
    .then(() => res.status(201).json({message: 'Nouvel utilisateur créé'})).
    catch(error => res.status(400).json({error: error}));
  })
  .catch(error => res.status(500).json({error: error}));
});

//Add new build
app.post("/api/addbuild", async (req, res) => {
  try {
    const body = req.body;
    const build = await new Build(body).save();
    res.json(build);
  } catch (e) {
    res.status(500).json(e);
  }
});

//Login 
app.post("/api/login", async (req, res) => {
  User.findOne({ email: req.body.email })
    .then(user => {
      if (!user) {
        return res.status(401).json({ error: 'Aucun utilisateur n\'est enregistré avec cet email' });
      }
      bcrypt.compare(req.body.pass, user.pass)
        .then(valid => {
          if (!valid) {
            return res.status(401).json({ error: 'Le mot de passe saisi est incorrect' });
          }
          res.status(200).json({
            user,
          });

        })
        .catch(error => res.status(500).json({ error }));
    })
});

app.listen(80);