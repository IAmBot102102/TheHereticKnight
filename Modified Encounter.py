#This is a combat encounter script. its probably terribly optimized but whatever.
#imma define a characers stats here
#it goes Priority, Health, Attack, Defense, Luck, Agility
#priority will Determine order of attacking. normally 1(slow),2(normal),3(fast). anything higher or lower is unusal (lets say 0 is Stopped Time and -1 is frozen in ice)
#i'll give you 3 guesses as to what health is
#lets say the damage formula is damage = ((float(cstats[2])*(20.0/(20.0+float(estats[3]))))//1.0)
#attack is basic damage. modified by weapons and stuff
#defense is defense. glad that's been explained.
#accuracy is chance to hit. should normally be very high. modified by smokescreens or inclement conditions
#agility is subtracted from accuracy. should normally be very low. if its too high, youll miss a lot and that leads to annoyance.
import time
import sys
import random
MCStats = [2,80,80,40,500,20]
LilGoblinStats =  [2,30,50,25,500,20]
LilGoblinExp = 20
LilGoblinGold = 20
PlayerGold = 0
PlayerExp = 0
Dots = ['.','.','.','.','.']
choicee = 0
response = 0
MCStatsTemp = MCStats
choice = 0
timesubuff = 1
choic3 = 0
choi = 0
bagnavi = 0
alreadyhave = 0
alreadyhave1 = 0
b = 0
choic4 = 0
a = 0
#An encounter with lil goblin, the best named enemy in the world
def LilGoblinEncounter():
    global MCStats
    global PlayerExp
    global PlayerGold
    global timesubuff
    #temp stats are used for temporary buffs and debuffs. hp is recorded in normal MCStats
    MCStatsTemp = MCStats
    print("Ya boi Lil' Goblin has arrived and it's time to attack")
    while LilGoblinStats[1] > 0:
        #i'll add magic options later. i dont know what kind of magic system we're operating on so its not here
        print("What do you do?")
        print(" 1: Attack")
        print(" 2: Do Nothing")
        print(" 3: Run")
        print(" 4: Menu")
        response = int(input(""))
        #This is the base attack script.
        if response == 1:
            #this checks priority
            #first is if the player attacks first, second is for the opposite
            if MCStatsTemp[0] >= LilGoblinStats[0]:
                #calculates and applies damage to the goblin
                aaa = random.randint(1,1000)
                if aaa < (MCStatsTemp[4] - MCStatsTemp[5]):
                    damagetofoe = int(((MCStatsTemp[2]*(10/(10+LilGoblinStats[3])))//1.0) + random.randint(1,10))
                    LilGoblinStats[1] = int((LilGoblinStats[1] - damagetofoe))
                    print("Hit Lil' Goblin for " + str(damagetofoe) + "!")
                    if LilGoblinStats[1] <= 0:
                        print("Lil' Goblin has been slain!")
                        input()
                        print("Gained " + str(LilGoblinExp) + " experience and " + str(LilGoblinGold) + " gold!")
                        PlayerExp += LilGoblinExp
                        PlayerGold += LilGoblinGold
                        return
                    
                else:
                    print("You missed, you stupid fuck.")
                    #calculates and applies damage to player
                    aaa = random.randint(1,1000)
                    if aaa < (LilGoblinStats[4] - LilGoblinStats[5]):
                        damagetoplayer = int(((LilGoblinStats[2]*(10/(10+MCStatsTemp[3])))//1.0) + random.randint(1,10))
                        MCStats[1] = int((MCStats[1] - damagetoplayer))
                        print("Lil' Goblin hits for " + str(damagetoplayer) + "!")
                        #checks to see if you are dead
                        if MCStats[1] <= 0:
                            print("You have died!")
                            input()
                            return
                    else:
                        print("The lil' shit that is lil goblin missed")
            else:
                #calculates and applies damage to player
                damagetoplayer = int(((LilGoblinStats[2]*(10/(10+MCStatsTemp[3])))//1.0) + random.randint(1,10))
                MCStats[1] = int((MCStats[1] - damagetoplayer))
                print("Lil' Goblin hits for " + str(damagetoplayer) + "!")
                #checks to see if you are dead
                if MCStats <= 0:
                    print("You have died!")
                    input()
                    return
                #calculates and applies damage to the goblin
                damagetofoe = int(((MCStatsTemp[2]*(10/(10+LilGoblinStats[3])))//1.0) + random.randint(1,10))
                LilGoblinStats[1] = int((LilGoblinStats[1] - damagetofoe))
                #checks to see if the goblin is dead
                if LilGoblinStats[1] <= 0:
                    print("Lil' Goblin has been slain!")
                    input()
                    print("Gained " + str(LilGoblinExp) + " experience and " + str(LilGoblinGold) + " gold!")
                    PlayerExp += LilGoblinExp
                    PlayerGold += LilGoblinGold
                    return
        elif response == 2:
            #Obviously, you pass up your turn
            print("You do nothing, you utter baboon.")
            input()
            if timesubuff <= 3:
                print("Well, I guess you may get a 10% accuracy buff . . .")
                MCStatsTemp[4] = MCStatsTemp[4] + 100
            timesubuff+=1
            damagetoplayer = int(((LilGoblinStats[2]*(10/(10+MCStatsTemp[3])))//1.0) + random.randint(1,10))
            MCStats[1] = int((MCStats[1] - damagetoplayer))
            print("Lil' Goblin hits for " + str(damagetoplayer) + "!")
            #checks to see if you are dead
            if MCStats[1] <= 0:
                print("You have died!")
                input()
                return
        elif response == 3:
            #This is the part for running away.
            print("You try to run away...")
            for i in Dots:
                sys.stdout.write(i)
                sys.stdout.flush()
                time.sleep(0.5)
            didwerun = random.randint(1,100)
            if didwerun >= 30:
                #successful escape
                print("\nEscaped successfully!")
                input()
                print("You gained nothing.")
                return
            else:
                #failure to escape
                print("\nYou have failed to escape!")
                damagetoplayer = int(((LilGoblinStats[2]*(10/(10+MCStatsTemp[3])))//1.0) + random.randint(1,10))
                MCStats[1] = int((MCStats[1] - damagetoplayer))
                print("Lil' Goblin hits for " + str(damagetoplayer) + "!")
                #checks to see if you are dead
                if MCStats[1] <= 0:
                    print("You have died!")
                    input()
                    return
        elif response == 4:
            #this is the battle menu. there ought to be a bag for items but i'm lazy and also dont know what to put in the bag
            menu()

def menu():
    global bagnavi
    print(" 1: Check stats")
    print(" 2: Bag")
    print(" 3: Return")
    response = int(input(""))
    if response == 1:
        print("You have " + str(MCStats[1]) + " HP, " + str(MCStatsTemp[2]) + " attack and " + str(MCStatsTemp[3]) + " defense.")
    elif response == 2:
        bagnavi = 0
        bag()
    else:
        LilGoblinEncounter()


def bag():
    global choicee
    global MCStatsTemp
    global MCStats
    global choice
    global Accessory
    global Weapon
    global choic3
    global choi
    global bagnavi
    global a
    global b
    global choic4
    if bagnavi == 0:
        bagnavi += 1
        if choice != 0:
            print("You have already equiped", '"', choic4, '"', ". Want to unequip? [y/n]: ")
            unequip = str(input(""))
            if unequip == "y":
                choicee = 0
                choice = 0
                a = MCStatsTemp[1]
                a -= b
                MCStatsTemp[1] = a
                MCStatsTemp = MCStats
                alreadyhave = 0
                bag()
            else:
                bag()
        else:
            bag()

    elif bagnavi == 1:
        bagnavi+= 1
        if choi != 0:
            print("You have already equiped", '"', choic3, '"', ". Want to unequip? [y/n]: ")
            unequip = str(input(""))
            if unequip == "y":
                choicee = 0
                choi = 0
                choic3 = 0
                a = MCStatsTemp[2]
                a -= b
                MCStatsTemp[2] = a
                MCStatsTemp = MCStats
                alreadyhave1 = 0
                bag()
            else:
                bag()
        else:
            bag()
                      
    else:
        bag2electricboogaloo()

def bag2electricboogaloo():
    global choicee
    global MCStatsTemp
    global MCStats
    global choice
    global Accessory
    global Weapon
    global choic3
    global choi
    global bagnavi
    global a
    global b
    global choic4
    print("Your Bag:")
    print("")
    print("Some random shit")
    print("Sword")
    print("Back")
    choicee = str(input("Enter an item to select it: "))
    if choicee == "Some random shit":
        if choice != 1:
            print("This buffs u, giving u plus 10 health.")
            wantt = str(input("Equip? [y/n]: "))
            if wantt == "y":
                choic4 = choicee
                b = 20
                a = MCStatsTemp[1]
                a += b
                MCStatsTemp[1] = a
                choice = 1
                print("Equiped!")
                alreadyhave = 1
                menu()
            else:
                bag()
        else:
            print("I'm sorry, but that's a no no action, child.")
            bag()
            
    elif choicee == "Sword":
        if choi != 1:
            print("Wtf do you think a sword does?")
            wantt = str(input("Equip? [y/n]: "))
            if wantt == "y":
                choic3 = choicee
                b = 10
                choi = 1
                a = MCStatsTemp[2]
                a += 10
                MCStatsTemp[2] = a
                print("Equiped!")
                alreadyhave1 = 1
                menu()
            else:
                bag()
        else:
            print("I'm sorry, but that's a no no action, child.")
            bag()
              
    else:
        LilGoblinEncounter()


#This calls the encounter

def usuck():
    abc = 1
    while abc == 1:
        try:
            LilGoblinEncounter()
            input("")
            abc = abc+1
        except:
            print("LOLOLOLOLOLOL XDXDXDXDXDXD You little shit, you think you can break the game? Go komet toaster bath XDXDXDXDXDXDXDXDXDXD!!!!!11!!!1!!!1!1")
            LilGoblinEncounter()

usuck()
