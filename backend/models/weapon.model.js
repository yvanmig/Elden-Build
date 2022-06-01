const mongoose = require("mongoose");
const schema = mongoose.Schema;

const weaponSchema = schema({
    weapon_id: {type: Number, required: true},
    name: {type: String, required: true},
    image: {type: String, required: true},
});

const EldenBuild = mongoose.model("weapons", weaponSchema);

module.exports = EldenBuild;