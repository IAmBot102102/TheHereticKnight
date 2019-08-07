var Choices = [];
var PlayerStats = {
	"Health" : 100.
	"Max Health" : 100,
	"Mana" : 10,
	"Max Mana" 10,
	"Chi" : 10,
	"Chi" : 10,
	"Power" : 10,
	"Resistance" : 10,
	"Luck" : 10,
	"AreaIn" : "TalasHouse",
	"Money" : 0
};
var ManaSkills = {
	"Mana Arrow" : 5
};
var ChiSkills = {
	"Healing Wish" : 1
};
var EnemyStats = {};
var Inventory = [];
console.log("Encounter with Starter Trainer Monter thing");
var Alive = true;
function EncounterLoop(){
	while(Alive == true){
		KeyActions(event);
	}
}

function KeyActions(event){
	var KeyAction = event.keyCode;
	alert(KeyAction);
}
var GameLoop = setInterval(EncounterLoop, 1000/60);