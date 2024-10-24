class Luffy: Hero{

    //Adds attacks to Luffy when a condition is met
    private (set) var hasAwakened: Bool{ 
        didSet{
            evolve()
        }
    }

    override var health: Int{
        //Luffy's awakening condition
        didSet{
            if (health <= 0) && !self.hasAwakened{
                print("Are you really willing to give up on your dream of becoming the Pirate King? (y/n): ", terminator: "") //ask if you want to give up if your health is 0
                let input = readLine()!
                if input == "n"{ //If you don't give up on your dream, then your health gets reset and you learn new moves 
                    print("You choose to continue fighting even tho you've long reached your limits. This leads you to finally unlock your true potential and can continue fighting.")
                    health = 100
                    self.hasAwakened = true
                }
            }
        }
    }
    init(){
        self.hasAwakened = false
        //initialise attacks
        let attack1 = Attack(name: "Gomu Gomu No Pistol", damage: 20)
        let attack2 = Attack(name: "Gomu Gomu No Bazooka", damage: 25)
        let attack3 = Attack(name: "Gear 2: Gomu Gomu no Jet Gatling", damage: 30)
        let attack4 = Attack(name: "Gear 3: Gomu Gomu No Elephant Gun", damage: 35)
        let luffyAttacks = [attack1, attack2, attack3, attack4]
        //initialise super class
        super.init(name: "Luffy", attacks: luffyAttacks) 

    }
    override func evolve(){
        addAttack(attack: Attack(name: "Gear 5: Gomu Gomu no Kaminari", damage: 50))
        addAttack(attack:Attack(name: "Gear 5: Gomu Gomu no Gigant", damage: 60))
    }
}