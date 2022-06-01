const mongoose = require("mongoose");
const schema = mongoose.Schema;

const talismanSchema = schema({
    talisman_id: {type: Number, required: true},
    name: {type: String, required: true},
    image: {type: String, required: true},
});

const EldenBuild = mongoose.model("talismans", talismanSchema);

module.exports = EldenBuild;