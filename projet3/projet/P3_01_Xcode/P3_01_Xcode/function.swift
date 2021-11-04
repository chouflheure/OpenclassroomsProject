
//This function it's call at different time in the code, action == 0 it's during the initialisation, when you choice your fighter
// Action == 1 - 2 when you need to select a fighter during the game to care or fight with other 
func choiceFighter(action : Int) -> String {
    var choix = readLine()
    if action == 0 {
        if Int(choix!) == nil
            { message(counter: 10); choix = choiceFighter(action : 0) }
        if Int(choix!) != nil && Int(choix!)! < 0 || Int(choix!)! > 6
            { message(counter: 10); choix = choiceFighter(action : 0) }
    }
    if action == 1 { // fight and care
        if Int(choix!) == nil
            { message(counter: 15); choix = choiceFighter(action : 1) }
        if Int(choix!) != nil && Int(choix!)! < 0 || Int(choix!)! > 2
            { message(counter: 15); choix = choiceFighter(action : 1) }
        if game.turn % 2 != 0 && J1.team[Int(choix!)!].life == 0 {message(counter: 17); choix = choiceFighter(action : 1)}
        if game.turn % 2 == 0 && J2.team[Int(choix!)!].life == 0 {message(counter: 17); choix = choiceFighter(action : 1)}
    }
    if action == 2 {
        if Int(choix!) == nil
            { message(counter: 16); choix = choiceFighter(action : 2) }
        if Int(choix!) != nil && Int(choix!)! < 3 || Int(choix!)! > 6
            { message(counter: 16); choix = choiceFighter(action : 2) }
        if game.turn % 2 == 0 && J1.team[Int(choix!)!-3].life == 0 {message(counter: 17); choix = choiceFighter(action : 2)}
        if game.turn % 2 != 0 && J2.team[Int(choix!)!-3].life == 0 {message(counter: 17); choix = choiceFighter(action : 2)}
    }
    return choix!
}

// this function it's for the name verification, We want just one time the name and not nil
func verificationName(arrayNameFighter: [String])-> String{
    print("Figther's name : ")
    var name = readLine()
    if (name!).count > 15{
        message(counter: 11)
        name = verificationName(arrayNameFighter: arrayNameFighter)
    }
    if arrayNameFighter.contains(name!){
        message(counter: 12)
        name = verificationName(arrayNameFighter: arrayNameFighter)
    }
    return name!
}

func typePlayer(id: Int) -> String {
    switch id {
    case 1:
        return "surfeur"
    case 2:
        return "tennisPlayer"
    case 3:
        return "cyclist"
    case 4:
        return "golfPlayer"
    case 5:
        return "footballer"
    case 6:
        return "hacker"
    default :
    return "no type"
    }
}

func emojieFighter(id: Int)->String{
    switch id {
    case 1:
        return "🏄‍♀️"
    case 2:
        return "🎾"
    case 3:
        return "🚴‍♂️"
    case 4:
        return "⛳️"
    case 5:
        return "⚽️"
    case 6:
        return "🧑‍💻"
    default :
    return "no type"
    }
}


