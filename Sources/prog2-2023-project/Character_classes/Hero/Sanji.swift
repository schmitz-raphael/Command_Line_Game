class Sanji : Hero{

//check if Raid suit is in inventory if yes, condition is met
    init(){
        //initialise attacks
        let attack1 = Attack(name: "Flambage Shot", damage: 30)
        let attack2 = Attack(name: "Concasse", damage: 35)
        let attack3 = Attack(name: "Collier Strike", damage: 35)
        let attack4 = Attack(name: "Diable Jambe Mutton Shot", damage: 40)
        let sanjiAttacks = [attack1, attack2, attack3, attack4]
        //initialise super class
        super.init(name: "Sanji", attacks: sanjiAttacks)
    }
    override func evolve(){
        addAttack(attack: Attack(name: "Raid Suit Aerial Kick", damage: 60))
    }
}