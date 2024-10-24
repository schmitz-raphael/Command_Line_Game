class Zorro : Hero{
    init(){
        //initialise attacks
        let attack1 = Attack(name: "One Sword Style Flying Dragon Blaze", damage: 35) 
        let attack2 = Attack(name: "One Sword Style 108 Pound Phoenix", damage: 30)  
        let attack3 = Attack(name: "Two Sword Style Gorilla Cut", damage: 40) 
        let attack4 = Attack(name: "Three Sword Style Oni Giri", damage: 30) 
        let zoroAttacks = [attack1, attack2, attack3, attack4]
        //intitialise super class
        super.init(name: "Zorro", attacks: zoroAttacks) 
    }
    override func evolve(){
        addAttack(attack: Attack(name: "Nine Sword Style Ashura Bakkai", damage: 60))
    }
}