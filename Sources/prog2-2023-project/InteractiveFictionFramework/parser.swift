/// DO NOT MODIFY!
/// Error type used in the controller
public enum ParserError:Error {
    
    /// Only white-space characters entered
    case noInputGiven
}

/// The `Parser` is responsible for retrieving user input and passing it over to the `Controller` to run commands.
class Parser {
    
    /// A symbol printed to show that user input is expected
    private let promptSymbol = ">"

    /// A reference to a game's controller, necessary to run commands
    private let controller:Controller
    
    /// Initializer
    public init(controller:Controller) {
        self.controller = controller
    }
    
    /**
     Retrieves user input from the command line (`stdin`) and runs the requested commands through the `Controller`.
     
     - Throws:
        - `ParserError.noInputGiven` if no input at all or only spaces were entered. At least one token (word) is expected from the user, arguments are optional but may be required by specific commands.
        - `CommandError.commandNotFound` if no command is registered for the first provided token (rethrown from `Controller.execute`)
     */
    func readCommand() throws {
        // print prompt symbol to invite user for input
        print("\(self.promptSymbol) ", terminator: "")
        
        // read a line (if any)
        guard let input = readLine() else {
            throw ParserError.noInputGiven
        }
        
        // split line into tokens
        var tokens = input.split(separator: " ").map { String($0) }
        
        // require at least 1 token
        guard tokens.count > 0 else {
            throw ParserError.noInputGiven
        }
        
        let commandKeyword = tokens.removeFirst()
        let arguments = tokens
        
        // try to execute a command for the given keyword with its arguments
        try self.controller.execute(command: commandKeyword, arguments: arguments)
    }
    
}
