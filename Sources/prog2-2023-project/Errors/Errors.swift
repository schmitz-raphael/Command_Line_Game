//in case there is no minigame
public enum MinigameError: Error{ 
    case NoMinigame
}
//in case a non existing character is picked
public enum CharacterCreationError: Error{ 
    case CharacterDoesNotExist
}
// in case there is no battle
public enum BattleError: Error{
    case noBattle
}
public enum LogPortError: Error{
    case noLogPort
}