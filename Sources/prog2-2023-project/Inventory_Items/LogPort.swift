
class LogPort: Item{
    var name: String = ""

    var description: String{
        "\(name)"
    }
    init(){
        self.name = "Log-Port"
    }
}