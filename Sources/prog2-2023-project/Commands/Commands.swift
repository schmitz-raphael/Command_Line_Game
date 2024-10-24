

//this command is used whenever there's a minigame on an island
class SolveCommand: Command{

    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        let currentIsland = onePiece.currentRoom as! Island
        
        do{
            if onePiece.auto{
                let solved = try currentIsland.autosolve()
                if solved{
                    onePiece.character!.inventory.addItem(item: RoadPoneglyph())
        
                }
            }
            else{
                let solved = try currentIsland.solve()
                if solved{
                    onePiece.character!.inventory.addItem(item: RoadPoneglyph())
                }
            }
        }
        catch MinigameError.NoMinigame{
            print("There's no minigame on the island")
        }
        catch{
            print("Unexpected error \(error)")
        }
    }
}
class PlayCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        let mc = onePiece.character!
        let currentIsland = onePiece.currentRoom as! Island
            

        if currentIsland.blackJack != nil{
            print("Welcome to the \(currentIsland.name) BlackJack table. \nIf you want to stop playing just enter -1 for the bet.")
            var bet: Int = 0
            while bet != -1{
                print("Enter your bet (you have \(mc.berries)): ", terminator: "")
                bet = Int(readLine()!)!
                if (bet != -1){
                    if (mc.berries >= bet){
                        mc.berries -= bet
                        mc.berries += currentIsland.play(bet: bet)
                    }

                    else{
                        print("You don't have enough berries.")
                    }
                }
            }
        }
        else{
            print("There's no BlackJack table on this island. Please visit Dressrosa if you want to play")
        }
    }
}

class FightCommand: Command{

    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        let currentIsland = onePiece.currentRoom as! Island
        
        do{
            if onePiece.auto{
                let won = try currentIsland.autofight(character: onePiece.character!)
                if won{
                    onePiece.character!.inventory.addItem(item: RoadPoneglyph())
        
                }
                else{
                    onePiece.badEnding()
                }
            }
            else{
                let won = try currentIsland.fight(character: onePiece.character!)
                if won{
                    onePiece.character!.inventory.addItem(item: RoadPoneglyph())
        
                }
                else{
                    onePiece.badEnding()
                }
            }
        }
        catch BattleError.noBattle{
            print("We know that you want to fight, but look elsewhere. ")
        }
        catch{
            print("Unexpected error \(error)")
        }
    }
}


class CookCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        if let character = onePiece.character{
            if character is Sanji{
                character.inventory.addItem(item: Food(value: 20, name: "Meat"))
                print("Sanji cooked himself some meat!")
            }
            if character is Zorro{
                print("Zorro got lost on his way to the kitchen!")
            }
            if character is Luffy{
                onePiece.secretEnding()
            }
        }
    }
}
class RestCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        if let character = onePiece.character{
            character.health = 100
            print("Your character is well rested now and can get back to combat again")
        }
    }
}
class InventoryCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        if let character = onePiece.character{
            character.inventory.printInv()
        }
    }
}

class MapCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        if let character = onePiece.character{
            do{
                try character.inventory.showMap(map: onePiece.rooms)
            }
            catch LogPortError.noLogPort{
                print("You have no Log Port in your inventory")
            }
            catch{
                print("Unexpected error \(error)")
            }
        }
    }
}

class BuyCommand: Command{
    func run(game: Game, arguments: [String]) {
        let onePiece = game as! OnePiece
        (onePiece.currentRoom as! Island).shop?.buy(hero: onePiece.character!)
        
        let character = onePiece.character!
        if character is Zorro{
            if character.inventory.inv.last is Enma{
                character.addAttack(attack: Attack(name: "Nine Sword Style Ashura Bakkai", damage: 60))
            }
        }
        if character is Sanji{
            if character.inventory.inv.last is RaidSuit{
                character.addAttack(attack: Attack(name: "Raid Suit Aerial Kick", damage: 60))
            }
        }
    }
}


