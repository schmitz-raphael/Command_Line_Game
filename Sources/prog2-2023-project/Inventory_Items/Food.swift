
class Food: Item{
    var name: String = ""

    var value: Int = 0

    var description: String{
        "\(name): \(value)"
    }
    init(value: Int, name: String){
        self.name = name
        self.value = value 
    }
    
}