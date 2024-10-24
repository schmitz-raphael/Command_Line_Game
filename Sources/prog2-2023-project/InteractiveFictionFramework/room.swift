/// DO NOT MODIFY!
/// Compass points used for setting room exits
enum Direction:String {
    /// 4 main cardinal points
    case North, East, South, West
}

/// A rudimentary implementation of a room (location) within the game map, based on a name and exits to other rooms. The exits are labeled with a `Direction`.
class Room {
    
    /// The name of the room (does not need to be an identifier)
    var name:String
    
    /// The exit map (initially empty)
    var exits = [Direction:Room]()
    
    /// Initializer
    init(name:String) {
        self.name = name
    }
    
    /**
     This function allows to retrieve a neighboring room based on its exit direction from inside the current room.
     
     - Parameters:
        - direction: A `Direction`
     - Returns: The room through the exit in the next direction (if any)
     */
    func nextRoom(direction:Direction) -> Room? {
        return exits[direction]
    }
    
}

/// Extension for the `CustomStringConvertible` protocol.
extension Room:CustomStringConvertible {

    /// The description includes the name of the room as well as all possible exit directions
    var description: String {
        return "You are in \(self.name)\n\nExits:\n\(self.exits.keys.map { "- \($0.rawValue)" }.joined(separator: "\n"))"
    }
    
}
