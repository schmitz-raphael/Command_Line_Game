
class Island: Room{
    private (set) var minigame: Minigame?
    private (set) var blackJack: BlackJack?
    private (set) var battle: Battle?
    private (set) var shop: Shop?


    //initialising the name and the minigames and battles if there are any
    init(name: String, minigame: Minigame? = nil, battle: Battle? = nil, hasBlackJack: Bool = false, shop: Shop? = nil){
        self.minigame = minigame
        self.battle = battle
        if (hasBlackJack){
            self.blackJack = BlackJack()
        }
        else{
            self.blackJack = nil
        }
        self.shop = shop
        super.init(name: name)
    }
    //function to solve the minigame on the island
    func solve() throws -> Bool{
        if let minigame = minigame{
            if (minigame.play()){
                print("Congrats by solving this very difficult trial, and have now collected one road-porneglyph")
                self.minigame = nil
                return true
            }
            else{
                print("Unfortunately, you failed this trial")
                return false
            }
        }
        else{
            throw MinigameError.NoMinigame
        }
    }
    //function to solve automatically
    func autosolve() throws -> Bool{
        if let minigame = minigame{
            if (minigame.autoplay()){
                print("Congrats by solving this very difficult trial, and have now collected one road-porneglyph")
                self.minigame = nil
                return true
            }
            else{
                print("Unfortunately, you failed this trial")
                return false
            }
        }
        else{
            throw MinigameError.NoMinigame
        }
    }

    //function to play Black Jack
    func play(bet: Int) -> Int{
        if let blackJack = blackJack{
            
            return blackJack.play(bet: bet)
        }
        else{
            return 0
        }
    }
    //command to enter a fight and throw an error if there isn't one
    func fight(character: Hero) throws -> Bool{
        if let battle = battle{
            if (battle.fight(character: character)){
                print("Congrats by winning this hard battle, you're one step closer to attain the One Piece")
                self.battle = nil
                return true
            }
            else{
                print("Unfortunately, you failed this trial")
                return false
            }
        }
        else{
            throw BattleError.noBattle
        }
    }
    //command to enter a fight and throw an error if there isn't one
    func autofight(character: Hero) throws -> Bool{
        if let battle = battle{
            if (battle.autofight(character: character)){
                print("Congrats by winning this hard battle, you're one step closer to attain the One Piece")
                self.battle = nil
                return true
            }
            else{
                print("Unfortunately, you failed this trial")
                return false
            }
        }
        else{
            throw BattleError.noBattle
        }
    }
    //function to check whether there is a battle or minigame on an island
    func hasTreasure() -> Bool{
        return self.minigame != nil || self.battle != nil
    }
}