class Hero: Character {
    var name: String
    var health: Int{
        // Make it so Health can not go above 100
        didSet{ 
            if health > 100{
                health = 100
            }
        }
    }
    var inventory : Inventory
    var attacks: [Attack] = []
    var berries: Int


    init(name: String, attacks: [Attack]){ 
        self.name = name
        self.health = 100
        self.inventory = Inventory()
        self.attacks = attacks
        self.berries = 1000
    }
    //adds and prints an attacks of a Subclass Character
    func addAttack(attack: Attack) { 
        self.attacks.append(attack)
        print("\(self.name) learned \(attack) ")
    }
    //Goes through the loop and prints all of the characters attacks
    func printAttack(){ 
        for (index,attack) in attacks.enumerated() {
            print("\(index + 1). \(attack)")
        }
    } 
    //Random attack for the Automated Game mode
    func nextAttack() -> Attack?{ 
        guard !attacks.isEmpty else {
            return nil
        }
        
        let randomIndex = Int.random(in: 0..<attacks.count)
        let attack = attacks[randomIndex]
        
        return attack
    }
    func evolve(){
        
    }
}