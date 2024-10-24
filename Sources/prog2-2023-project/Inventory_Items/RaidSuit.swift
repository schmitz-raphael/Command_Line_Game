

class RaidSuit: Item{
    var name: String = ""

    var description: String{
        "Germa 66 scientific wonder: \(name)"
    }
    init(){
        self.name = "Raid Suit"
    }
    
}