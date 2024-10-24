class Shop {
    var items: [Item]
    var prices: [Int]

    init(items: [Item], prices: [Int]) {
        self.items = items
        self.prices = prices
    }

    //Buy an Item from the shop
    func buy(hero: Hero) { 
        print("Welcome to the shop!")
        print("Here are the items available for purchase:")
        
        var continueShopping = true
        
        while !items.isEmpty && continueShopping {
            //prints all the items
            for (index, item) in items.enumerated() { 
                print("\(index+1). \(item.name) (\(prices[index]) berries)")
            }

            print("Which item would you like to buy? (Enter the item number or type -1 to exit)")

            //checks for the input and if it is -1 to exit
            if let input = readLine(), let choice = Int(input), choice != -1 { 
                let itemIndex = choice - 1
                // checks if the input is valid 
                if itemIndex >= 0 && itemIndex < items.count { 
                    let price = prices[itemIndex]
                    let item = items[itemIndex]

                    // checks if you have enough money
                    if hero.berries >= price { 
                        hero.berries -= price
                        hero.inventory.addItem(item: item)
                        if item.name == "Enma" && hero is Zorro{
                            hero.evolve()
                        } 
                        if item.name == "Raid Suit" && hero is Sanji{
                            hero.evolve()
                        }
                        items.remove(at: itemIndex)
                        prices.remove(at: itemIndex)
                        
                        print("Congratulations, you have purchased \(item.name)!")
                    } else {
                        print("\u{001B}[31mSorry, you don't have enough berries to buy \(item.name). Do more battles to gain Berries.\u{001B}[0m")
                    }
                } else {
                    print("\u{001B}[31mInvalid item number.\u{001B}[0m")
                }
            } else {
                print("Thanks for visiting the shop!")
                continueShopping = false
            }
        }
        
        if items.isEmpty {
            print("The shop is now empty!")
        }
    }
}
