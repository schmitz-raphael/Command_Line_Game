import Foundation

/*
    ->Fishman Island ------> Dressrosa <------> Zou <-----------------> Land of Wano
            |                                  |                          |
            |                                  |                          |
            |                                  |                          |
            Laugh Tale                   Whole cake island <---------->  Elbaf  ----> Fishman Island
*/ 

class OnePiece:Game{
    
    lazy var controller = Controller(game: self)

    lazy var parser = Parser(controller: self.controller)

    var character: Hero?
    var finished = false

    var rooms: [Room]

    var currentRoom: Room

    var auto: Bool = false
    var roomCache: [String] = []

    init(){
        self.rooms = OnePiece.createMap()
        self.currentRoom = self.rooms.first!
        self.roomCache = ["Fishman Island"]
        self.addCommands()
    }

    private class func createMap() -> [Room]{
        //initalise minigames
        let rockPaperScissors = RockPaperScissors()
        let ticTacToe = TicTacToe()
        //initialise villains for battles
        let bigMom = BigMom()
        let kaido = Kaido()
        //initialise battles
        let bigMomBattle = Battle(villain: bigMom)
        let kaidoBattle = Battle(villain: kaido)
        //initialise shops
        let fishmanIslandShop = Shop(items: [LogPort(), Food(value: 60, name: "Meat"), Food(value:50, name: "Cola")], prices: [500, 150, 75])
        let landOfWanoShop = Shop(items: [Enma(), Food(value:40, name: "Cola"), Food(value:60, name: "Meat")], prices: [500, 150, 75])
        let wholeCakeIslandShop = Shop(items: [RaidSuit(), Food(value:60, name: "Meat"), Food(value: 40, name: "Cola")], prices: [500, 150, 75])

        //initialise islands
        let fishmanIsland = Island(name:"Fishman Island", shop: fishmanIslandShop)
        let dressrosa = Island(name: "Dressrosa", hasBlackJack: true)
        let zou = Island(name: "Zou", minigame: rockPaperScissors)
        let wholeCakeIsland = Island(name:"Whole Cake Island", battle: bigMomBattle, shop: wholeCakeIslandShop)
        let landOfWano = Island(name: "Land of Wano", battle: kaidoBattle, shop: landOfWanoShop)
        let elbaf = Island(name: "Elbaf", minigame: ticTacToe)
        
        //Adjusting the exits of all the islands
        fishmanIsland.exits = [.East: dressrosa]
        dressrosa.exits = [.East: zou]
        zou.exits = [.East: landOfWano, .South: wholeCakeIsland, .West: dressrosa]
        wholeCakeIsland.exits = [.East: elbaf, .North: zou]
        landOfWano.exits = [.South: elbaf, .West: zou]
        elbaf.exits = [.West: wholeCakeIsland, .North: landOfWano, .East:fishmanIsland]

        //adding descriptions for the user to further understand the politics and history of the island
        return [fishmanIsland, dressrosa, zou, wholeCakeIsland, landOfWano, elbaf]
    }
    private func addCommands(){
        self.controller.register(keyword: "help", command: HelpCommand())
        self.controller.register(keyword: "move", command: GoCommand())
        self.controller.register(keyword: "stop", command: StopCommand())
        self.controller.register(keyword: "solve", command: SolveCommand())
        self.controller.register(keyword: "play", command: PlayCommand())
        self.controller.register(keyword: "fight", command: FightCommand())
        self.controller.register(keyword: "cook", command: CookCommand())
        self.controller.register(keyword: "rest", command: RestCommand())
        self.controller.register(keyword: "inventory", command: InventoryCommand())
        self.controller.register(keyword: "map", command: MapCommand())
        self.controller.register(keyword: "buy", command: BuyCommand())
    }
    private func createCharacter(args: String) throws -> Hero{
        if (args == "Vinsmoke Sanji"){
            return Sanji()
        }
        else if (args == "Roronoa Zorro"){
            return Zorro()
        }
        else if (args == "Monkey D. Luffy"){
            return Luffy()
        }
        else{
            throw CharacterCreationError.CharacterDoesNotExist
        }
    }
     private func intro() {
        //the game starts off with the legend that started everything
        print("Wealth, fame, power. The world had it all won by one man: the Pirate King, Gold Roger.")
        print("At his death, the words he spoke drove countless men out to sea.") 
        print("My treasure? It's yours if you want it. Find it! I left all the world has there!")
        print("And so men set sights on the Grand Line, in pursuit of their dreams.")
        print()
        //character selection
        print("You, the player take the role of one of the Straw hat pirates, a rising pirate crew in the pursuit of the legendary treasure")
        print("You have the choice between playing as\n1. Monkey D. Luffy, the always hungry captain of the crew")
        print("2. Roronoa Zorro, the swordsman of the ship with a very bad sense of direction")
        print("3. Vinsmoke Sanji, the cook of the ship who loses his entire composure when it comes to women\n")
        print("Enter the full name of the character which you want to play: ", terminator: "")
        while self.character == nil{
            let txt = readLine()!
            do{
                self.character =  try createCharacter(args: txt)
                print("You've chosen to play as \(txt)")
                break
            }catch CharacterCreationError.CharacterDoesNotExist{
                print("Please enter the name of a playable character named above: ", terminator: "")
            }catch{
                print("Unknown Error: \(error)")
            }
        }
        while true{
            print("Are you going to play manually (y/n): ", terminator: "")
            let input = readLine()!
            if input == "y"{
                self.auto = false
                break
            }
            else if input == "n"{
                self.auto = true
                if character is Zorro || character is Sanji{}
                self.character!.evolve()
                break
            }
        }
        print("Your journey starts on Fishman Island, the first island of the 2nd half of the Grand Line, called the New World.")
    }
    //Functions for the endings of the game
    func goodEnding() {
        print("By reaching the secret island Laugh Tale and obtaining the legendary treasure the One Piece, Monkey D. Luffy arises to the title of Pirate King and who knows what he's up to in the future")
        self.finished = true
    }
    func badEnding(){
        print("Your death has lead to the demise of the Straw hat pirates and Luffy is unable to become Pirate king")
        self.finished = true
    }
    func secretEnding(){
        print("Luffy has found his way to the kitchen, however his bad cooking skills lead him to poison himself.")
        self.finished = true
    }

    //play function
    func play() {
        intro()
        while !self.finished {
            print("\n\(self.currentRoom)\n")
            
            
            if self.auto {
                let island = currentRoom as! Island
                let shop = island.shop
                if let shop = shop{
                    for item in shop.items{
                        character?.inventory.addItem(item: item)
                    }
                }
                while island.hasTreasure(){
                    SolveCommand().run(game: self, arguments: [])
                    FightCommand().run(game: self, arguments: [])
                    if (self.finished){
                        break
                    }
                }
                RestCommand().run(game: self, arguments: [])
                var direction = [Direction.East, .South, .West, .North].randomElement()
                while island.nextRoom(direction: direction!) == nil || roomCache.contains(island.nextRoom(direction: direction!)!.name){
                    direction = [Direction.East, .South, .West, .North].randomElement()
                }
                let nextRoom = currentRoom.nextRoom(direction: direction!)!
                if nextRoom.name != "Elbaf"{
                    roomCache.append(nextRoom.name)
                }
                currentRoom = currentRoom.nextRoom(direction: direction!)!
            }
            else{
                do {
                    try parser.readCommand()
                } catch ParserError.noInputGiven {
                    print("No input given")
                } catch CommandError.commandNotFound(let keyword) {
                    print("No command found for keyword '\(keyword)'")
                } catch {
                    print("Unexpected error: \(error)")
                }
            }

            if (character!.inventory.countPoneglyph() == 4){
                character!.inventory.removePoneglyphs()
                let laughTale = Room(name: "Laugh Tale")
                rooms.append(laughTale)
                rooms[0].exits = [.East: rooms[1], .South: laughTale]
                if self.auto{
                roomCache.remove(at: 0)
                }
                print("By acquiring the 4 Road-Poneglyphes, the location of the secret island has been revealed and it seems as though you were already very close at the start.")
            }
            if (self.currentRoom.name == "Laugh Tale"){
                goodEnding()
            }
        }
    }
}
let g = OnePiece()
g.play()

