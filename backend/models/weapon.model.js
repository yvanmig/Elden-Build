const mongoose = require("mongoose");
const schema = mongoose.Schema;

const weaponSchema = schema({
    name: {type: String, required: true},
    image: {type: String, required: true},
});

const EldenBuild = mongoose.model("weapons", buildSchema);

module.exports = EldenBuild;