struct Attack : CustomStringConvertible{
    let name: String
    let damage : Int

    var description: String{
        "\(self.name) (damage: \(self.damage))"
    }
}