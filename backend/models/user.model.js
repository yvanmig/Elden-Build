const mongoose = require("mongoose");
const schema = mongoose.Schema;

const userSchema = schema({
    pseudo: {type: String, required: true},
    email: {type: String, required: true},
    photo: {type: String, required: true},
    bio: {type: String, required: true}
});

const EldenBuild = mongoose.model("users", userSchema);

module.exports = EldenBuild;