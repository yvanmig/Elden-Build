const mongoose = require("mongoose");
const schema = mongoose.Schema;

const buildSchema = schema({
    name: {type: String, required: true},
    image: {type: String, required: true},
    description: {type: String, required: true},
    mainStat1: {type: String, required: true},
    mainStat2: {type: String, required: true},
    vigor: {type: Number, required: true}, 
    mind: {type: Number, required: true},
    endurence: {type: Number, required: true},
    strength: {type: Number, required: true},
    dexterity: {type: Number, required: true},
    intelligence: {type: Number, required: true},
    faith: {type: Number, required: true},
    arcane: {type: Number, required: true},
    weapon1: {type: Number, required: true}, 
    weapon2: {type: Number, required: false},
    weapon3: {type: Number, required: false},
    spell1: {type: Number, required: true}, 
    spell2: {type: Number, required: false},
    spell3: {type: Number, required: false},
    talisman1: {type: Number, required: true}, 
    talisman2: {type: Number, required: true},
    talisman3: {type: Number, required: true},
});

const EldenBuild = mongoose.model("builds", buildSchema);

module.exports = EldenBuild;