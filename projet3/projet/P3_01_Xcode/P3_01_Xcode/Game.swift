class Game {
    var turn = 1
    var winner = ""

    // this function increments tunr
    func turnMore(){
        turn += 1
    }
    // this function clear the console to have the info always in the same place
    func clearConsol(){
        for _ in 1...40{
            print("\n")
        }
    }
    
    // the message when you begin the game
    func startGame(){
        print("                                  \t\t⚔️ Hobbies war ⚔️\n")
    }
    
    // the fighter menu where you can see the Fighters' id ans name
    func fighterMenu(){
        print( "\nIn this game you will select 3 fighters in your team and you will fight with an other team\n"
            + "\n1. 🏄‍♀️ Surf        : 🫀 80  💣 40   \t2. 🎾 Tennisman  : 🫀 90  💣 30   \t\t3. 🚴‍♂️ Cyclist : 🫀 80  💣 40"
            + "\n4. ⛳️ Golf Player : 🫀 50  💣 60   \t5. ⚽️ Footballer : 🫀 90  💣 20   \t\t6. 🧑‍💻 Nurd    : 🫀 70  💣 50"
            + "\n"
        )
    }
    
    // function where you select the fighter's name
    func presentationPlayer()->String{
        print("What is the name of your team ?")
        var nom = readLine()
        if nom!.count > 15 { // the limit of words
            print("Warnig, your name need to be less than 15 words")
            nom = presentationPlayer()
        }
        return nom!
    }
    
    // This function take information give by messageBuilder to print all of them
    func printScenario(scenario: String, dataJ1: String, dataJ2: String){
        switch scenario {
            case "turn":
                print("              ############### TURN \(self.turn)  ###############")
            case "haut":
                print("✖️-------------------------------------------------------------✖️")
            case "bas":
                print("✖️-------------------------------------------------------------✖️\n\n")
            case "separation":
                print("✖️------------------------------|------------------------------✖️")
            case "player":
                print(" | \(dataJ1) | \(dataJ2) |")
            default:
                print("rien")
        }
    }
    
    // this function creat the space between the data and the end of the XXXX
    func spaceInInterface(countData: Int, scale: Int) -> String{
        var space = String()
        for _ in countData..<scale
        { space += " " }
        return space
    }

        
    // this function it's for select diffrent fighter's state and send to the function to print them before
    func messageMenuBulder(scenario: String, counter: Int) -> String{
        var data = String(), space = String()
        switch scenario {
            case "namePlayerJ1":
                space = spaceInInterface(countData: J1.namePlayer.count, scale: 23)
                data = " 🤵‍♂️  \(J1.namePlayer)\(space)"
            
            case "namePlayerJ2":
                space = spaceInInterface(countData: J2.namePlayer.count, scale: 23)
                data = "\(space)\(J2.namePlayer)  🤵‍♀️ "
                
            case "nameFighterJ1":
                space = spaceInInterface(countData: J1.team[counter].nom.count, scale: 22)
                data = "  \(J1.team[counter].emojie)  \(J1.team[counter].nom)\(space)"
                
            case "nameFighterJ2":
                space = spaceInInterface(countData: J2.team[counter].nom.count, scale: 23)
                data = "\(space)\(J2.team[counter].nom) \(J2.team[counter].emojie)  "
                
            case "attackDataJ1":
                space = spaceInInterface(countData: String(J1.team[counter].attack).count, scale: 20)
                data = "   💣  \(String(J1.team[counter].attack)) \(space)"
            
            case "attackDataJ2":
                space = spaceInInterface(countData: String(J2.team[counter].attack).count, scale: 21)
                data = "\(space)💣  \(J2.team[counter].attack)   "
            
            case "lifeDataJ1":
                space = spaceInInterface(countData: String(J1.team[counter].life).count, scale: 21)
                data = "   🫀  \(J1.team[counter].life)\(space)"
            
            case "lifeDataJ2":
                space = spaceInInterface(countData: String(J2.team[counter].life).count, scale: 21)
                data = "\(space)🫀  \(J2.team[counter].life)   "
            
            case "deadFighterNameJ1":
                space = spaceInInterface(countData: J1.team[counter].nom.count, scale: 20)
                data = "\(J1.team[counter].emojie)  \(J1.team[counter].nom) ☠️ \(space)"
                
            case "deadFighterNameJ2":
                space = spaceInInterface(countData: J2.team[counter].nom.count, scale: 20)
                data = "\(space) ☠️ \(J2.team[counter].nom)  \(J2.team[counter].emojie)"
                
            case "careJ1":
                space = spaceInInterface(countData: J1.team[counter].nom.count, scale: 21)
                data = "\(counter). \(J1.team[counter].emojie)  \(J1.team[counter].nom)\(space)"
                
            case "careJ2":
                space = spaceInInterface(countData: J2.team[counter].nom.count, scale: 22)
                data = "\(space) \(counter).\(J2.team[counter].nom) \(J2.team[counter].emojie)"
            
            case "fightJ1":
                space = spaceInInterface(countData: J1.team[counter].nom.count, scale: 21)
                data = "\(counter). \(J1.team[counter].emojie)  \(J1.team[counter].nom)\(space)"
        
            case "fightJ2":
                space = spaceInInterface(countData: J2.team[counter].nom.count, scale: 21)
                data = "\(space) \(counter). \(J2.team[counter].nom) \(J2.team[counter].emojie)"

            case "victimJ1":
                space = spaceInInterface(countData: J1.team[counter].nom.count, scale: 21)
                data = "\(counter+3). \(J1.team[counter].emojie)  \(J1.team[counter].nom)\(space)"
            
            case "victimJ2":
                space = spaceInInterface(countData: J2.team[counter].nom.count, scale: 20)
                data = "\(space) \(counter+3). \(J2.team[counter].emojie)  \(J2.team[counter].nom)"
                
            case "winnerPlayerNameJ1":
                space = spaceInInterface(countData: J1.namePlayer.count, scale: 20)
                data = " 🤵‍♂️  \(J1.namePlayer) 🏆 \(space)"
            
            case "winnerPlayerNameJ2":
                space = spaceInInterface(countData: J2.namePlayer.count, scale: 20)
                data = " 🏆 \(space)\(J2.namePlayer)  🤵‍♀️ "
        
            default:
                space = spaceInInterface(countData : 0, scale: 13)
                data = "\(space)☠️\(space)"
        }
        return data
        }
        
    
    func printMenu(action: String){
    
        var dataJ1 = String(), dataJ2 = String(), lifeJ1 = String(), lifeJ2 = String(), attackJ1 = String(), attackJ2 = String(), scenarioJ1 = String(), scenarioJ2 = String()
    
        switch action {
            case "presentation":
                scenarioJ1 = "nameFighterJ1"
                scenarioJ2 = "nameFighterJ2"
            case "care":
                if turn % 2 != 0 { scenarioJ1 = "careJ1"; scenarioJ2 = "nameFighterJ2" }
                if turn % 2 == 0 { scenarioJ1 = "nameFighterJ1"; scenarioJ2 = "careJ2" }
            case "fight":
                if turn % 2 != 0 { scenarioJ1 = "fightJ1"; scenarioJ2 = "victimJ2" }
                if turn % 2 == 0 { scenarioJ1 = "victimJ1"; scenarioJ2 = "fightJ2" }
            default:
                scenarioJ1 = "nameFighterJ1"
                scenarioJ2 = "nameFighterJ2"
        }
        
        // print the turn's number
        printScenario(scenario: "turn", dataJ1: "", dataJ2: "")
        
        // start graphic interface
        printScenario(scenario: "haut", dataJ1: "", dataJ2: "")
        
        // Print the team's name
        if J1.team[0].life == 0 && J1.team[1].life == 0 && J1.team[2].life == 0 {  dataJ1 = messageMenuBulder(scenario: "winnerPlayerNameJ1", counter: 0) }
        else { dataJ1 = messageMenuBulder(scenario: "namePlayerJ1", counter: 0) }
        if J2.team[0].life == 0 && J2.team[1].life == 0 && J2.team[2].life == 0 {  dataJ2 = messageMenuBulder(scenario: "winnerPlayerNameJ2", counter: 0) }
        else { dataJ2 = messageMenuBulder(scenario: "namePlayerJ2", counter: 0) }
        
        // presentation profil
        printScenario(scenario: "player", dataJ1: dataJ1, dataJ2: dataJ2)
        
        // barrière i ntermédiaire
        printScenario(scenario:"separation", dataJ1: "", dataJ2: "")
        
        // a loop that creat the interface with player data for each team
        for i in 0...2 {
            if J1.team[i].life == 0 {
                dataJ1 = messageMenuBulder(scenario: "deadFighterNameJ1", counter: i)
                lifeJ1 = messageMenuBulder(scenario: "", counter: i)
                attackJ1 = messageMenuBulder(scenario: "", counter: i)
            }
            else {
                dataJ1 = messageMenuBulder(scenario: scenarioJ1, counter: i)
                lifeJ1 = messageMenuBulder(scenario: "lifeDataJ1", counter: i)
                attackJ1 = messageMenuBulder(scenario: "attackDataJ1", counter: i)
            }
            
            if J2.team[i].life == 0 {
                dataJ2 = messageMenuBulder(scenario: "deadFighterNameJ2", counter: i)
                lifeJ2 = messageMenuBulder(scenario: "", counter: i)
                attackJ2 = messageMenuBulder(scenario: "", counter: i)
            }
            else {
                dataJ2 = messageMenuBulder(scenario: scenarioJ2, counter: i)
                lifeJ2 = messageMenuBulder(scenario: "lifeDataJ2", counter: i)
                attackJ2 = messageMenuBulder(scenario: "attackDataJ2", counter: i)
            }
            
            printScenario(scenario: "player", dataJ1: dataJ1, dataJ2: dataJ2)
            printScenario(scenario: "player", dataJ1: lifeJ1, dataJ2: lifeJ2)
            printScenario(scenario: "player", dataJ1: attackJ1, dataJ2: attackJ2)
            
            if i != 2 { printScenario(scenario:"separation", dataJ1: "", dataJ2: "") }
                    
            }

        printScenario(scenario: "bas", dataJ1: "", dataJ2: "")
    }
    
    // this function is the bool to define if a game is finish or not, and call an other function for the message of the end
    func endGame(arrayRecordGame: [String]) -> Bool{
        if J1.team[0].life == 0 && J1.team[1].life == 0 && J1.team[2].life == 0 {
            messageEndGame(winner:J2,arrayRecordGame:arrayRecordGame)
            return true
        }
        if J2.team[0].life == 0 && J2.team[1].life == 0 && J2.team[2].life == 0 {
            messageEndGame(winner:J1,arrayRecordGame:arrayRecordGame)
            return true
        }
        return false
    }
    
    //this function is call by endGame when a team win to print the message of the end
    func messageEndGame(winner: Player,arrayRecordGame: [String]){
        print("The end of the game")
        print("Winner : \(winner.namePlayer) en \(game.turn-1) tours")
        print("Fighters state : \(printMenu(action: "presentation"))")
        print("The record of the game :")
        for i in 0...arrayRecordGame.count-1 {
            print("turn \(i+1) -> \(arrayRecordGame[i])")
        }
    }
    

    // this function generate random chest
    func chest(){
        var i = 0, rand = Int.random(in: 0...2)
        let arrayArm = ["french baguette":10,"bow":80,"Hedgehog":40 ]
        if Int.random(in: 0...2) == 1 {
            print("Voici un coffre !! ")
            for (arm, power) in arrayArm {
                if i == rand {
                    self.clearConsol()
                    print("                 \t🧳 A CHEST !!! 🧳")
                    if (self.turn % 2 != 0) { J1.team[i].attack = power; print("Your fighter \(J1.team[i].nom) get a \(arm), with a power : \(power)") }
                    if (self.turn % 2 == 0) { J2.team[i].attack = power; print("Your fighter \(J2.team[i].nom) get a \(arm), with a power : \(power)") }
                    self.printMenu(action : "presentation")
                    print("press a key to return to the fight")
                    readLine()
                }
                i += 1
            }
        }
    }
    
    // this function check if the choice ( Attack or Care ) is correct, it's the same like choice Fighter
    func choiceAttack0rCare()->String{
        var choiceTurn = readLine()

        if Int(choiceTurn!) == nil
        { message(counter: 10); choiceTurn = choiceAttack0rCare() }
        if Int(choiceTurn!) != nil && Int(choiceTurn!)! < 0 || Int(choiceTurn!)! > 2
        { message(counter: 10); choiceTurn = choiceAttack0rCare() }

        return choiceTurn!
    }

    // this function record alla ction during the game. 2 case, fight or care and record informations
    func recordGame(action : Int, fighter1 : Fighter, fighter2: Fighter) -> String{
        var record = String()
        switch action {
        case 1:
            if self.turn % 2 != 0 {record = "\(fighter1.nom) ⚔️ \(fighter2.nom)"}
            if self.turn % 2 != 0 && fighter2.life == 0 {record = "\(fighter1.nom) ⚔️ \(fighter2.nom) => \(fighter2.nom) ☠️"}
            if self.turn % 2 == 0 {record = "\(fighter2.nom) ⚔️ \(fighter1.nom)"}
            if self.turn % 2 == 0 && fighter1.life == 0 {record = "\(fighter2.nom) ⚔️ \(fighter1.nom) => \(fighter1.nom) ☠️"}
        case 2:
            if self.turn % 2 != 0 {record = "\(fighter1.nom) used a potion, +30 HP"}
            if self.turn % 2 == 0 {record = "\(fighter2.nom) used a potion, +30 HP"}
        default:
            print("rien")
        }
        return record
    }
  
}

