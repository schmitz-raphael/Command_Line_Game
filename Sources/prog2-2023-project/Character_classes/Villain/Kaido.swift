class Kaido: Villain{

    //checking If Kaido is in Dragonform 
    var dragonForm = false{  
        didSet{
            //if Yes use dragonAttacks as moveset
            if dragonForm{ 
                attacks = dragonAttacks()
            }
            //if no use normalAttacks as moveset
            else{ 
                attacks = normalAttacks()
            }
        }
    }
    
    init(){
        //initialise attacks
        let attack1 = Attack(name: "Borobreath", damage: 10)
        let attack2 = Attack(name: "Kosanze Ragnaraku", damage: 12)
        let attack3 = Attack(name: "Warai Jogo Ragnaraku", damage: 13)
        let attack4 = Attack(name: "Conqueror's haki", damage: 0) //Hero sits out 2 turns
        let attack5 = Attack(name: "Dragon Transformation", damage: 0) // Kaido will change into his dragon form 
        let attacks = [attack1, attack2, attack3, attack4, attack5]
        super.init(name: "Kaido", attacks: attacks)
    }
      private func normalAttacks() -> [Attack] {
        let attack1 = Attack(name: "Borobreath", damage: 10)
        let attack2 = Attack(name: "Kosanze Ragnaraku", damage: 12)
        let attack3 = Attack(name: "Warai Jogo Ragnaraku", damage: 13)
        let attack4 = Attack(name: "Conqueror's haki", damage: 0) //Hero sits out 2 turns
        let attack5 = Attack(name: "Dragon Transformation", damage: 0) // Kaido will change into his dragon form 
        return [attack1, attack2, attack3, attack4, attack5]
    }
    
    private func dragonAttacks() -> [Attack] {
        let attack6 = Attack(name: "Dragontwister", damage: 15)
        let attack7 = Attack(name: "Flame Bagua", damage: 15)
        let attack8 = Attack(name: "Conqueror's haki", damage: 0) //Hero sits out 2 turns
        let attack9 = Attack(name: "Human Transformation", damage: 0)
        return [attack6, attack7, attack8, attack9]
    }
    //Override of the random attack function
    override func nextAttack() -> Attack?{ 
        guard !attacks.isEmpty else {
            return nil
        }
        
        let randomIndex = Int.random(in: 0..<attacks.count)
        let attack = attacks[randomIndex]
        
        // checking whether to take attacks from normalAttacks() or dragonAttacks()
        if attack.name == "Dragon Transformation"{ 
            dragonForm = true
        }
        if attack.name == "Human Transformation"{
            dragonForm = false
        }
        return attack
    }
}
