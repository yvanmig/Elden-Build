const mongoose = require("mongoose");
const schema = mongoose.Schema;

const spellSchema = schema({
    name: {type: String, required: true},
    image: {type: String, required: true},
});

const EldenBuild = mongoose.model("spells", buildSchema);

module.exports = EldenBuild;