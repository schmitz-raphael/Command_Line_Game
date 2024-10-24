# Pretext

This project was a group assignment done for the Programming 2 course, that was built with the help of 2 classmates.
# Programming 2 (2023): Interactive Fiction - Template

Build your game on top of the provided framework `Sources/prog2-2023-project/InteractiveFictionFramework`.
- Do not modify the files contained in that folder!
- You can find an example project using that framework in the lab solutions repo.

## Possible issue when building

Double-check the .vscode/launch.json file:
- Wherever you see the line `workspaceFolder:prog2-2023-project-template`, adjust it to your group's repo name.
- Normally VSC adjusts this automatically, but if it hasn't then perform this change yourself.

# Build instructions 

No third-party APIs have been used.

# Changes to the initial project description

## Characters 

The characters have undergone some modifications, wherein some of their individual traits have been removed. Instead, they have been given individual battle moves and possibly items that can enhance their powers.

- Monkey D. Luffy, the captain of the Straw hat pirates, is no longer a good eater. However, while he's still unaware of it, he has hidden powers in him, which can only be awoken in combat.

- Roronoa Zorro, a swordsman that practices the 3-sword style. He is known for his bad sense of direction. Rumors say that he is one of the selected few who can successfully wield one of the legendary swords.

- Vinsmoke Sanji, the cook aboard the ship, has always been known for his chivalry and code of honor that prevents him from hurting women. However, things have changed. We removed his chivalry, but instead Sanji has been given a powerful item, which grants him enhanced abilities and enables him to overcome his previous limitations.

##  Collectible Items

A few adjustments have been made to the collectible items:

- Road Poneglyphs --> In order to reach Laugh Tale, a pirate must be in possession of the four Road Poneglyphs, which function as a key to the final island.

- Food --> which can either be bought from shops on an island or cooked. If you want to cook, choose your character wisely.

- Enma --> A legendary sword which Zoro can obtain in the Land of Wano in order to learn new attacks.

- Raid Suit --> A work of science that allows Sanji to learn new attacks.

## Minigames

Apart from the two mini-games that are already known,

- Rock-paper-scissors 
- Tic-tac-toe

We have decided to introduce a new one to the list. This game has been designed with the goal of allowing players to make a lot of money. Fast!

- Blackjack

## Battles

There will be 2 battles against Kaido and Big-Mom, which need to be defeated in order to obtain their road-Poneglyphes.

The battles will work in a turn-based combat like in normal Role-Playing Games.

Each character and enemy will have a set of attacks, which will deal a set amount of damage, while NO LONGER draining stamina.

Every playable character has their own way to learn new Attacks.

Zorro and Sanji will awaken once they find a certain item on the map.

Meanwhile, Luffy has to reach his limits during combat in order to awaken his hidden powers.

## Interactions 

Our interactions have probably gotten the biggest change.

Here are the now usable commands:

- "help" in order to print all usable commands to the player

- "move" in order to sail from island to the next one

- "stop" in order to stop the game entirely

- "solve" in order to solve the mini-game if there is a mini-game on the island

- "play" in order to play the money mini-game if there is a money mini-game on the island

- "fight" in order to battle it out if there is a battle on the island

- "cook"
    Sanji can add food to his own inventory.
    Nothing happens when Zorro uses it as he's unable to find the kitchen.
    Luffy will die because he's unaware of his bad cooking skills and poisons himself.

- "rest" in order to refill the health bar of the playable character

- "inventory" in order to print all the items in the inventory

- "map" in order to print the map (only works if the Log-Port is in the inventory).

- "buy" in order to buy items at a shop, if there is one on the island.

## Points System

- Health: used in combats, can be restored upon eating food.

- Stamina Points (SP) --> used in combats in order to perform attacks (Has been Removed)

- Berry: monetary system which allows the player to buy food or items from shops.


# Bonus Features

We have implemented multiple bonus features:

- We have implemented so-called "Shops," which are located on Fishman Island, the Land of Wano, and Whole Cake Island. They allow the player to trade their currency for items. Items that can be bought from shops include:
    - different kinds of Food
    - Log Port (our map)
    - Enma
    - Raid Suit, ...

- All three of our characters have their own way to evolve:
    - Zoro can evolve by upgrading his sword
    - Sanji can evolve by obtaining the Raid Suit
    - Luffy can evolve by reaching his limits in combats

- All three of our characters have the ability to cook, but:
    - If Luffy cooks, there's a special interaction
    - If Zoro tries to cook, he will have trouble finding the kitchen.
    - If Sanji tries to cook, he will successfully add food to your inventory.

- Three endings have been added to the game:
    - goodEnding(), if you manage to find all four Road-Poneglyphs.
    - badEnding(), if you die in combat.
    - secretEnding(), as in the name it's secret (Let Luffy cook).

# Special Swift language features

We used "\u{001B}[31m" and ".\u{001B}[0m" to make the text turn red 
(only used in the Shop.swift)

# Bugs and Issues

# Automated Game Mode

Considering that our room layout is mostly linear, the player decides the direction he goes into by going in a random direction and checking if he's already been on that island. This is done over a cache, we called "roomCache". We only needed to exclude Elbaf out of that list, because it's a cross point. So after Zou, the player either goes to Land Of Wano/ Whole-Cake-Island, then Elbaf in both cases, to only go to the only island left and go back to Elbaf. At this point the player has all 4 porneglyphs, so while unlocking Laugh Tale, Fishman Island becomes available again, so the player can go there.

Battles and all minigames (except BlackJack, cause it's not a necessity) have been changed to play them automatically. 

While in auto mode, the player also claims all items of a shop, without having to buy them. 

# Full console output

Wealth, fame, power. The world had it all won by one man: the Pirate King, Gold Roger.
At his death, the words he spoke drove countless men out to sea.
My treasure? It's yours if you want it. Find it! I left all the world has there!
And so men set sights on the Grand Line, in pursuit of their dreams.

You, the player take the role of one of the Straw hat pirates, a rising pirate crew in the pursuit of the legendary treasure
You have the choice between playing as
1. Monkey D. Luffy, the always hungry captain of the crew
2. Roronoa Zorro, the swordsman of the ship with a very bad sense of direction
3. Vinsmoke Sanji, the cook of the ship who loses his entire composure when it comes to women

Enter the full name of the character which you want to play: Roronoa Zorro
You've chosen to play as Roronoa Zorro
Are you going to play manually (y/n): y
Your journey starts on Fishman Island, the first island of the 2nd half of the Grand Line, called the New World.

You are in Fishman Island

Exits:
- East

> buy
Welcome to the shop!
Here are the items available for purchase:
1. Log-Port (500 berries)
2. Meat (150 berries)
3. Cola (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Congratulations, you have purchased Log-Port!
1. Meat (150 berries)
2. Cola (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Congratulations, you have purchased Meat!
1. Cola (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Congratulations, you have purchased Cola!
The shop is now empty!

You are in Fishman Island

Exits:
- East

> map
->Fishman Island ()<--------------> Dressrosa ()<--------------> Zou (X)<-----------> Land of Wano (X)
                                                                 |                       |
                                                                 |                       |
                                                                 |                       |
                                                    Whole Cake Island (X) <--------->  Elbaf (X)----> Fishman Island

You are in Fishman Island

Exits:
- East

> move East

You are in Dressrosa

Exits:
- East

> play
Welcome to the Dressrosa BlackJack table. 
If you want to stop playing just enter -1 for the bet.
Enter your bet (you have 275): 275
Player's Hand:

Eight of Diamonds
Nine of Hearts
Player's Hand Value: 17
Hit or Stand? (h/s): s
Player's Hand:

Eight of Diamonds
Nine of Hearts
Player's Hand Value: 17

Dealer's Hand: 

Jack of Diamonds
Five of Spades
Nine of Diamonds
Dealer's Hand Value: 24
Dealer busts! Player wins.
Enter your bet (you have 2750): 1000
Player's Hand:

King of Hearts
King of Diamonds
Player's Hand Value: 20
Hit or Stand? (h/s): s
Player's Hand:

King of Hearts
King of Diamonds
Player's Hand Value: 20

Dealer's Hand: 

Three of Diamonds
Two of Spades
Queen of Hearts
Six of Clubs
Dealer's Hand Value: 21
Dealer wins!
Enter your bet (you have 1750): 1000
Player's Hand:

Queen of Hearts
Ace of Hearts
Player's Hand Value: 21

Dealer's Hand: 

Three of Spades
King of Clubs
Jack of Diamonds
Dealer's Hand Value: 23
Dealer busts! Player wins.
Enter your bet (you have 10750): -1

You are in Dressrosa

Exits:
- East

> move East

You are in Zou

Exits:
- East
- South
- West

> solve
What do you want to play (Rock-Paper-Scissors): Rock
The opponent chose Scissors, congrats you won this one
Score: 1 - 0
What do you want to play (Rock-Paper-Scissors): Rock
The opponent chose Scissors, congrats you won this one
Score: 2 - 0
What do you want to play (Rock-Paper-Scissors): Paper
The opponent chose Scissors, you lose
Score: 2 - 1
What do you want to play (Rock-Paper-Scissors): Rock
The opponent chose Scissors, congrats you won this one
Score: 3 - 1
Congrats by solving this very difficult trial, and have now collected one road-porneglyph

You are in Zou

Exits:
- East
- South
- West

> move East

You are in Land of Wano

Exits:
- West
- South

> buy
Welcome to the shop!
Here are the items available for purchase:
1. Enma (500 berries)
2. Cola (150 berries)
3. Meat (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Zorro learned Nine Sword Style Ashura Bakkai (damage: 60) 
Congratulations, you have purchased Enma!
1. Cola (150 berries)
2. Meat (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Congratulations, you have purchased Cola!
1. Meat (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Congratulations, you have purchased Meat!
The shop is now empty!

You are in Land of Wano

Exits:
- West
- South

> fight
Your health: 100
Enemy health: 250


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Kaido uses Kosanze Ragnaraku (damage: 12)

Your health: 88
Enemy health: 190


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Kaido uses Conqueror's haki (damage: 0)

Your health: 88
Enemy health: 130

Your character is affected by Conqueror's Haki and has to sit out for 2 turns

Kaido uses Kosanze Ragnaraku (damage: 12)

Your health: 76
Enemy health: 130

Your character is affected by Conqueror's Haki and has to sit out for 1 turns

Kaido uses Dragon Transformation (damage: 0)

Your health: 76
Enemy health: 130


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Kaido uses Flame Bagua (damage: 15)

Your health: 61
Enemy health: 70


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Kaido uses Dragontwister (damage: 15)

Your health: 46
Enemy health: 10


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Congrats by winning this hard battle, you're one step closer to attain the One Piece

You are in Land of Wano

Exits:
- West
- South

> rest
Your character is well rested now and can get back to combat again

You are in Land of Wano

Exits:
- West
- South

> move South

You are in Elbaf

Exits:
- East
- West
- North

> solve

 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9

What will you play: 1

 X | 2 | 3
---+---+---
 O | 5 | 6
---+---+---
 7 | 8 | 9

What will you play: 3

 X | 2 | X
---+---+---
 O | 5 | 6
---+---+---
 7 | O | 9

What will you play: 2

 X | X | X
---+---+---
 O | 5 | O
---+---+---
 7 | O | 9

Congrats by solving this very difficult trial, and have now collected one road-porneglyph

You are in Elbaf

Exits:
- East
- West
- North

> move West

You are in Whole Cake Island

Exits:
- North
- East

> buy
Welcome to the shop!
Here are the items available for purchase:
1. Raid Suit (500 berries)
2. Meat (150 berries)
3. Cola (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Congratulations, you have purchased Raid Suit!
1. Meat (150 berries)
2. Cola (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Congratulations, you have purchased Meat!
1. Cola (75 berries)
Which item would you like to buy? (Enter the item number or type -1 to exit)
1
Congratulations, you have purchased Cola!
The shop is now empty!

You are in Whole Cake Island

Exits:
- North
- East

> fight
Your health: 100
Enemy health: 250


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Big Mom  uses Conqueror's haki (damage: 0)

Your health: 100
Enemy health: 190

Your character is affected by Conqueror's Haki and has to sit out for 2 turns

Big Mom  uses Zeus Thunderbolt (damage: 12)

Your health: 88
Enemy health: 190

Your character is affected by Conqueror's Haki and has to sit out for 1 turns

Big Mom  uses Heavenly Fire (damage: 13)

1Your health: 75
Enemy health: 190


1. Attack
2. Use item
What do you want to do: 

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Big Mom  uses Ryou Blast (damage: 15)

Your health: 60
Enemy health: 130


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Big Mom  uses Soul Pocus (damage: 30)

Your health: 30
Enemy health: 70


1. Attack
2. Use item
What do you want to do: 2

Player inventory:
1. Log-Port
2. Meat: 60
3. Cola: 50
4. Road-Poneglyph
5. King of hell Enma
6. Cola: 40
7. Meat: 60
8. Road-Poneglyph
9. Road-Poneglyph
10. Germa 66 scientific wonder: Raid Suit
11. Meat: 60
12. Cola: 40
()
Choose which item to use (-1 to exit): 11
Big Mom  uses Soul Pocus (damage: 30)

Your health: 60
Enemy health: 70


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Big Mom  uses Zeus Thunderbolt (damage: 12)

Your health: 48
Enemy health: 10


1. Attack
2. Use item
What do you want to do: 1

1. One Sword Style Flying Dragon Blaze (damage: 35)
2. One Sword Style 108 Pound Phoenix (damage: 30)
3. Two Sword Style Gorilla Cut (damage: 40)
4. Three Sword Style Oni Giri (damage: 30)
5. Nine Sword Style Ashura Bakkai (damage: 60)
Choose your attack (-1 to exit): 5

Zorro uses Nine Sword Style Ashura Bakkai (damage: 60)
Congrats by winning this hard battle, you're one step closer to attain the One Piece
By acquiring the 4 Road-Poneglyphes, the location of the secret island has been revealed and it seems as though you were already very close at the start.

You are in Whole Cake Island

Exits:
- North
- East

> map
->Fishman Island <--------------> Dressrosa <--------------> Zou <-----------> Land of Wano
      |                                                       |                       |
      |                                                       |                       |
      |                                                       |                       |
    Laugh Tale                                       Whole Cake Island  <--------->  Elbaf ----> Fishman Island

You are in Whole Cake Island

Exits:
- North
- East

> move East

You are in Elbaf

Exits:
- East
- West
- North

> move East

You are in Fishman Island

Exits:
- South
- East

> move South
By reaching the secret island Laugh Tale and obtaining the legendary treasure the One Piece, Monkey D. Luffy arises to the title of Pirate King and who knows what he's up to in the future
