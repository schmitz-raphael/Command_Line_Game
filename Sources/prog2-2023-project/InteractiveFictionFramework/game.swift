/// DO NOT MODIFY!
/// The `Game` protocol shall be adopted by a concrete game *class*.
protocol Game:AnyObject {
    
    /// A reference to a controller, comprising the recognized keywords and commands
    var controller:Controller { get }
    
    /// A flag symbolizing whether the game is still running or not
    var finished:Bool { get set }
    
    /// The room in which the player is currently located in
    var currentRoom:Room { get set }
    
}
