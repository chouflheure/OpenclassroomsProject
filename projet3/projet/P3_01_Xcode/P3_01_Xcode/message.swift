func message(counter: Int){
    
    switch counter {
    case 10 :
        print("              Your message need to be an integer, between 1 and 6")
    case 11 :
        print("              The name need to be less than 15 words")
    case 12 :
        print("              This name is already use")
    case 13 :
        print("                     \(J1.namePlayer) takes a choice : \n"
        + "\n"
        + "              1. Attack ⚔️\t \t 2. Care 🩹"
        )
    case 14 :
        print("                     \(J2.namePlayer) takes a choice :\n"
        + "\n"
        + "              1. Attack ⚔️\t \t 2. Care 🩹"
        )
    case 15:
        print("              Your message need to be an integer, between 1 and 3")
    case 16:
        print("              Your message need to be an integer, between 4 and 6")
    case 17:
        print("              This fighter is dead, choices an other")
    default:
        print("raté")
    }
}
