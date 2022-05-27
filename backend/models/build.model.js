const mongoose = require("mongoose");
const schema = mongoose.Schema;

const buildSchema = schema({
    name: {type: String, required: true},
    image: {type: String, required: true},
    description: {type: String, required: true},
    stat1: {type: String, required: true},
    stat2: {type: String, required: true}
});

const EldenBuild = mongoose.model("builds", buildSchema);

module.exports = EldenBuild;