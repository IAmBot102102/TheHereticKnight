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
var EnemyStats = {
	"Health" : 0,
	"Mana" : 0,
	"Chi" : 0,
	"Damage" : 0,
	"Defense" : 0.
	"Luck" : 0
};
var Inventory = [];
console.log("Encounter with Starter Trainer Monter thing");\
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

function RandomizeEnemyStats(){
	EnemyStats["Health"] = 100 + Math.round(Math.random()*20)
	EnemyStats["Mana"] = 10 + Math.round(Math.random()*20)
	EnemyStats["Chi"] = 10 + Math.round(Math.random()*20)
	EnemyStats["Damage"] = 10 + Math.round(Math.random()*20)
	EnemyStats["Defense"] = 10 + Math.round(Math.random()*20)
	EnemyStats["Luck"] = 20 + Math.round(Math.random()*20)

}
var attacks = {
	"Attack" : 0,
	"Defend" : 0,
	"ManaSkill" : 10,
	"ChiSkill" : 10
};
RandomizeEnemyStats()
var attacked = false;
while(Alive == true){
	alert(EnemyStats);
	var dope = prompt("What do you do? \n Attack \n Defend \n ManaSkill \n ChiSkill");
	if(dope == "Attack"){
		EnemyStats["Health"] -= Math.round(PlayerStats["Damage"] / 2);
	} else if(dope == "Defend"){
		PlayerStats["Defense"] = PlayerStats["Defense"] * 2;
	} else if(dope == "ManaSkill"){
		PlayerStats["Mana"] -= ManaSkills["Mana Arrow"]
		EnemyStats["Health"] 
	}
}