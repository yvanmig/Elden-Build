const mongoose = require("mongoose");
const schema = mongoose.Schema;

const talismanSchema = schema({
    name: {type: String, required: true},
    image: {type: String, required: true},
});

const EldenBuild = mongoose.model("talismans", buildSchema);

module.exports = EldenBuild;