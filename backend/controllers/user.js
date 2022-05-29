const User = require('../models/user.model');
const bcrypt = require('bcrypt');

exports.getOneUser = (req, res, next) => {
  User.findOne({
      _email: req.params.email
  }).then(
    () => {
      res.status(200).json(user);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};
  
exports.createUser = (req, res, next) => {
  bcrypt.hash(req.body.password, 10)
  .then(hash => {
  const user = new User({
    email: req.body.email,
    password: hash,
    photo: req.body.photo,
    bio: req.body.bio,
    pseudo: req.body.pseudo
  });
  user.save()
  .then(() => res.status(201).json({message: 'Nouvel utilisateur créé'})).
  catch(error => res.status(400).json({error: error}));
})
.catch(error => res.status(500).json({error: error}));
};


exports.login = (req, res, next) => {
  User.findOne({ email: req.body.email })
    .then(user => {
      if (!user) {
        return res.status(401).json({ error: 'Aucun utilisateur n\'est enregistré avec cet email' });
      }
    //   bcrypt.compare(req.body.password, user.password)
    //     .then(valid => {
    //       if (!valid) {
    //         return res.status(401).json({ error: 'Le mot de passe saisi est incorrect' });
    //       }
    //       res.status(200).json({
    //         userId: user._id,
    //       });
          res.status(200).json({
              userId: user._email
        })
        .catch(error => res.status(500).json({ error }));
    })
    .catch(error => res.status(500).json({ error }));
};
