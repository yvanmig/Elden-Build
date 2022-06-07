const mongoose = require("mongoose");
const schema = mongoose.Schema;

const spellSchema = schema({
    spell_id: {type: Number, required: true},
    name: {type: String, required: true},
    image: {type: String, required: true},
});

const EldenBuild = mongoose.model("spells", spellSchema);

module.exports = EldenBuild;