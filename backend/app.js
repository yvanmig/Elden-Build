const express = require('express');
const mongoose = require('mongoose');
const cors = require("cors");


// A MODIFIER AVEC LES INFOS DE VOTRE CONNEXION 
mongoose.connect("mongodb+srv://coucou:coucou@cluster0.qdchu.mongodb.net/EldenBuild?retryWrites=true&w=majority",
  { useNewUrlParser: true,
    useUnifiedTopology: true })
  .then(() => console.log('Connexion à MongoDB réussie !'))
  .catch(() => console.log('Connexion à MongoDB échouée !'));


const userRoutes = require('./routes/user');

const app = express();

// Middleware
app.use(express.json()); // Pour extraire le corps JSON des requêtes POST

app.use(cors());

// Routes
app.use('/api/users', userRoutes);

module.exports = app;