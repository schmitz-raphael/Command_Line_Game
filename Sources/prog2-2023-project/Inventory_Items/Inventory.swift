class Inventory{ 
    var inv: [Item]

    init(){
        self.inv = []
    }

    //print the inventory 
    func printInv(){ 
        print("Player inventory:")
        for (index, item) in inv.enumerated(){
            print("\(index+1). \(item)")
        }
    }
    //add an item to the inventory
    func addItem(item: Item){ 
        inv.append(item)
    }
  
    //return the item on the given index
    func getItem(itemIndex: Int) -> Item{ 
        return inv[itemIndex]
    }

    //use the item (e.g: Meat)
    func useItem(itemIndex: Int){
        inv.remove(at: itemIndex)
    }

    // returns the amount of inv in your inventory
    func count() -> Int{ 
        return inv.count
    }

    //returns the number of Poneglyphs in your inventory 
    func countPoneglyph() -> Int{ 
        var count = 0
        for item in inv{
            if item is RoadPoneglyph{
                count += 1
            }
        }
        return count
    }

    // removes all Poneglyphs
    func removePoneglyphs(){ 
        var index = 0
        while index < inv.count {
        if inv[index] is RoadPoneglyph {
            inv.remove(at: index)
        } else {
            index += 1
        }
}
    }
    //command used to print map
    func showMap(map: [Room]) throws {
        for item in inv{
            if item is LogPort{
                if map.last!.name == "Laugh Tale" {
                    print("""
                    ->\(map[0].name) <--------------> \(map[1].name) <--------------> \(map[2].name) <-----------> \(map[4].name)
                          |                                                       |                       |
                          |                                                       |                       |
                          |                                                       |                       |
                        \(map[6].name)                                       \(map[3].name)  <--------->  \(map[5].name) ----> \(map[0].name)
                    """)
                } else {
                    print("""
                    ->\(map[0].name) (\((map[0] as! Island).hasTreasure() ? "X" :""))<--------------> \(map[1].name) (\((map[1] as! Island).hasTreasure() ? "X" :""))<--------------> \(map[2].name) (\((map[2] as! Island).hasTreasure() ? "X" :""))<-----------> \(map[4].name) (\((map[4] as! Island).hasTreasure() ? "X" :""))
                                                                                     |                       |
                                                                                     |                       |
                                                                                     |                       |
                                                                        \(map[3].name) (\((map[3] as! Island).hasTreasure() ? "X" :"")) <--------->  \(map[5].name) (\((map[3] as! Island).hasTreasure() ? "X" :""))----> \(map[0].name)
                    """)
                }
                return //to leave function before throwing the error
            }
        }
        throw LogPortError.noLogPort
    }

}