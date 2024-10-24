import Foundation

class Battle{ 
    let villain: Villain

    init(villain: Villain){
        self.villain = villain
    }

    //fight function returns True if you win and False if you lose 
    func fight(character: Hero) -> Bool{ 
        var playerCooldown = 0
        while character.health > 0 && villain.health > 0{

            //show health of player and foe
            print("Your health: \(character.health)") 
            print("Enemy health: \(villain.health)\n")

            // PlayerCooldown is increased when the player needs to sit out turns (every +1 means 1 turn to wait)
            if (playerCooldown == 0){ 
                // ask for input to either attack or use item
                while true{ 
                    print("\n1. Attack\n2. Use item")
                    print("What do you want to do: ",terminator: "")
                    let input = Int(readLine()!)!
                    print()
                    // print and choose attack
                    if input == 1{ 
                        character.printAttack()
                        print("Choose your attack (-1 to exit): ", terminator: "")
                        var input = Int(readLine()!)!
                        //check if it is a valid attack
                        while (-1..<character.attacks.count+1).contains(input) == false {
                            print("Choose your attack (enter the number): ", terminator: "")
                            input = Int(readLine()!)!
                        }
                        // checks what attack was used and deals damage accordingly
                        if (input != -1){ 
                            print()
                            let attack = character.attacks[input-1]
                            print("\(character.name) uses \(attack)")
                            villain.health -= attack.damage
                            break
                        }
                    }
                    
                    //print and choose item to use 
                    else if input == 2{   
                        print(character.inventory.printInv())
                        print("Choose which item to use (-1 to exit): ", terminator: "")
                        var input = Int(readLine()!)!
                        while (-1..<character.inventory.count()+1).contains(input) == false {
                            print("Choose which item to use (-1 to exit): ", terminator: "")
                            input = Int(readLine()!)!
                        }
                        //checks what item was chosen and applies its effect accordingly
                        if (input != -1){ 
                            let item = character.inventory.getItem(itemIndex: input-1)
                            if item is Food{
                                let food = (item as! Food)
                                character.health += food.value
                                character.inventory.useItem(itemIndex: input-1)
                                break
                            }
                            else{
                                print("This item cannot be used in combat!")
                            }
                        }
                    }
                }
            }
            else{
                print("Your character is affected by Conqueror's Haki and has to sit out for \(playerCooldown) turns\n")
                playerCooldown -= 1
            }
            // villain Attacking and decreasing the Heros health
            if villain.health > 0{ 
                let enemyAttack = villain.nextAttack()!
                print("\(villain.name) uses \(enemyAttack)\n")
                character.health -= enemyAttack.damage
                //makes the player sit out 2 turns
                if (enemyAttack.name == "Conqueror's haki") { 
                    playerCooldown += 2
                }
            }
            sleep(1)
        }
        if (character.health <= 0){
            return false
        }
        else{
            return true
        }
    }
    func autofight(character: Hero) -> Bool{
        var playerCooldown = 0
        while character.health > 0 && villain.health > 0{
            //show health of player and foe
            print("Your health: \(character.health)")
            print("Enemy health: \(villain.health)\n")

            if (playerCooldown == 0){
                while true{
                    //if character is under 50 health, use food if there is, else attack
                    if (character.health < 50){
                        for (index, item) in character.inventory.inv.enumerated(){
                            if item is Food{
                                print("Player uses", item)
                                character.health += (item as! Food).value
                                character.inventory.inv.remove(at: index)
                                break
                            }
                        }
                        //if no food attack
                        let attack = character.nextAttack()!
                        print("\(character.name) uses \(attack)\n")
                        villain.health -= attack.damage
                        break
                    }
                    else{
                        let attack = character.nextAttack()!
                        print("\(character.name) uses \(attack)\n")
                        villain.health -= attack.damage
                        break
                    }
                }
                
            }
            else{
                print("Your character is affected by Conqueror's Haki and has to sit out for \(playerCooldown) turns\n")
                playerCooldown -= 1
            }
            if villain.health > 0{
                let enemyAttack = villain.nextAttack()!
                print("\(villain.name) uses \(enemyAttack)\n")
                character.health -= enemyAttack.damage
                if (enemyAttack.name == "Conqueror's haki") {
                    playerCooldown += 2
                }
            }
        }
        //checks if you lost
        if (character.health <= 0){ 
            return false
        }
        // checks if you won
        else{ 
            return true
        }
    }
}

