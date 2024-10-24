class BigMom: Villain{
    
    init(){
        //initialise attacks
        let attack1 = Attack(name: "Soul Pocus", damage: 30) 
        let attack2 = Attack(name: "Zeus Thunderbolt", damage: 12)
        let attack3 = Attack(name: "Heavenly Fire", damage: 13)
        let attack4 = Attack(name: "Ryou Blast", damage: 15)
        let attack5 = Attack(name: "Conqueror's haki", damage: 0)  // makes Player sit out 2 turns
        let attacks = [attack1, attack2, attack3, attack4, attack5]
        //initialise super class
        super.init(name: "Big Mom ", attacks: attacks) 
    }
}