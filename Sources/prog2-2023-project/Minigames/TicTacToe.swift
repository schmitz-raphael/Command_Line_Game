

class TicTacToe: Minigame{ 
    var board = [["1","2","3"],["4","5","6"], ["7","8","9"]]


    //prints the game board
    func printBoard(){ 
        print()
        print(" \(board[0][0]) | \(board[0][1]) | \(board[0][2])")
        print("---+---+---")
        print(" \(board[1][0]) | \(board[1][1]) | \(board[1][2])")
        print("---+---+---")
        print(" \(board[2][0]) | \(board[2][1]) | \(board[2][2])")
        print()
    }

    func play() -> Bool {
        board = [["1","2","3"],["4","5","6"], ["7","8","9"]]
        while checkBoard() == nil{
            printBoard()
            print("What will you play: ", terminator: "")
            //checks iif the input is valid
            if let input = readLine(), let position = Int(input){ 
                let row = (position - 1) / 3
                let column = (position - 1) % 3
                if position < 1 || position > 9 {
                    print("Invalid input. Please enter a number between 1 and 9.")
                } 
                // checks if the field was already used
                else if board[row][column] == "X" || board[row][column] == "O" { 
                    print("That position is already taken. Please choose a different one.")
                } else { //plays the turn
                    board[row][column] = "X"
                    //randomizes the enemies choices
                    var enemy_row = Int.random(in: 0..<3) 
                    var enemy_column = Int.random(in: 0..<3)
                    //if place on board taken, find another field
                    while board[enemy_row][enemy_column] == "X" || board[enemy_row][enemy_column] == "O" {
                        enemy_row = Int.random(in: 0..<3)
                        enemy_column = Int.random(in: 0..<3)
                    }
                    board[enemy_row][enemy_column] = "O"
                }
            }
            else{
                print("Invalid input, please enter a number, between 1 and 9")
            }
        }
        printBoard()
        if checkBoard() == "X"{
            return true
        }
        else{
            return false
        }
    }
    func autoplay() -> Bool {
        var count = 0
        board = [["1","2","3"],["4","5","6"], ["7","8","9"]]
        while checkBoard() == nil{
            printBoard()
            var row = Int.random(in: 0..<3)
            var column = Int.random(in: 0..<3)
            while board[row][column] == "X" || board[row][column] == "O" {
                row = Int.random(in: 0..<3)
                column = Int.random(in: 0..<3)
            }
            board[row][column] = "X"
            count += 1

            if (count == 9){
                break
            }
            var enemy_row = Int.random(in: 0..<3)
            var enemy_column = Int.random(in: 0..<3)
            //if place on board taken, find another field
            while board[enemy_row][enemy_column] == "X" || board[enemy_row][enemy_column] == "O" && count < 8{
                enemy_row = Int.random(in: 0..<3)
                enemy_column = Int.random(in: 0..<3)
            }
            board[enemy_row][enemy_column] = "O"
            count += 1

        }
        printBoard()
        if checkBoard() == "X"{
            return true
        }
        else{
            return false
        }
    }
    func checkBoard() -> String?{
        for row in board {
            if row == ["X", "X", "X"] {
                return "X"
            } else if row == ["O", "O", "O"] {
                return "O"
            }
        }
        // Check columns for a win
        for i in 0..<board.count {
            let column = [board[0][i], board[1][i], board[2][i]]
            if column == ["X", "X", "X"] {
                return "X"
            } 
            else if column == ["O", "O", "O"] {
                return "O"
            }
        }
        
        // Check diagonals for a win
        let diagonal1 = [board[0][0], board[1][1], board[2][2]]
        let diagonal2 = [board[0][2], board[1][1], board[2][0]]
        if diagonal1 == ["X", "X", "X"] || diagonal2 == ["X", "X", "X"] {
            return "X"
        } else if diagonal1 == ["O", "O", "O"] || diagonal2 == ["O", "O", "O"] {
            return "O"
        }
        // If no winner, return nil
        return nil
    }
}
