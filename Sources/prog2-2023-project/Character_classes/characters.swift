protocol Character { 
    var name: String { get }
    var health: Int { get }

    var attacks: [Attack] {get}

}