
enum Choice: String{
    case Rock = "Rock", Paper = "Paper", Scissors = "Scissors"
}

class RockPaperScissors: Minigame{
    var strongAgainst : [Choice: Choice] = [:]

    init(){
        self.strongAgainst[.Rock] = .Scissors
        self.strongAgainst[.Scissors] = .Paper
        self.strongAgainst[.Paper] = .Rock
    }
    func play() -> Bool {
        var winCounter: Int = 0
        var loseCounter: Int = 0
        //Loops until you either win or lose
        while (winCounter != 3 && loseCounter != 3){
            print("What do you want to play (Rock-Paper-Scissors): ", terminator: "")
            let text = readLine()
            let choice = Choice(rawValue: text!)
            // checks if your choise is strong against opponent choise
            if let choice = choice{
                let opponentChoice = strongAgainst.values.randomElement()!
                // When your choise is strong
                if strongAgainst[choice] == opponentChoice{
                    winCounter += 1
                    print("The opponent chose \(opponentChoice), congrats you won this one")
                }
                // When your choise is the same
                else if (choice == opponentChoice){
                    print("The opponent chose \(opponentChoice), the round will be reset")
                }
                // When your choise is weak
                else{
                    print("The opponent chose \(opponentChoice), you lose")
                    loseCounter += 1
                }
            }
            print("Score: \(winCounter) - \(loseCounter)")
        }
        if winCounter == 3{
            return true
        }
        else{
            return false
        }
    }
    func autoplay() -> Bool {
        var winCounter: Int = 0
        var loseCounter: Int = 0
        while (winCounter != 3 && loseCounter != 3){
            let playerChoice = strongAgainst.values.randomElement()!
            let opponentChoice = strongAgainst.values.randomElement()!

            if strongAgainst[playerChoice] == opponentChoice{
                winCounter += 1
                print("The opponent chose \(opponentChoice), congrats you won this one")
            }
            else if (playerChoice == opponentChoice){
                print("The opponent chose \(opponentChoice), the round will be reset")
            }
            else{
                print("The opponent chose \(opponentChoice), you lose")
                loseCounter += 1
            }
            print("Score: \(winCounter) - \(loseCounter)")
        }
        if winCounter == 3{
            return true
        }
        else{
            return false
        }
    }
}