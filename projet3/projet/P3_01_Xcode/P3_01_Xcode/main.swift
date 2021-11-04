// array that records the choice of fighters
var arrayChoiceFighter : [Int] = []

// array that records the choice of name fighters
var arrayNameFighter : [String] = []

// array that records the choice of the name team
var arrayNameTeam : [String] = []

// declaration game of class Game
let game = Game()

// Fighters' data
let arrayFighterData =
    [
        ["id": 1, "life": 80, "attack": 40],
        ["id": 2, "life": 90, "attack": 30],
        ["id": 3, "life": 80, "attack": 40],
        ["id": 4, "life": 50, "attack": 60],
        ["id": 5, "life": 90, "attack": 20],
        ["id": 6, "life": 70, "attack": 50]
    ]

// Clear the concole to have the info always in the same place
game.clearConsol()

// Message that present the game
game.startGame()

for i in 1...6 {
    
    // function that present fighters
    game.fighterMenu()
    
    if i < 4 { print("Player 1 does your choice number \(i) :") }
    else { print("Player 2 does your choice number \(i-3) :") }
    
    // function that checks if the choice of fighter is possible
    let choiceFighter = choiceFighter(action : 0)
    arrayChoiceFighter.insert(Int(choiceFighter)!-1, at: arrayChoiceFighter.count)
    
    // function that checks if the choice of the name is possible
    let nameFighter = verificationName(arrayNameFighter: arrayNameFighter)
    arrayNameFighter.insert(nameFighter, at: arrayNameFighter.count)
    
    game.clearConsol()
    
    // this part ask the name of the team after fighter selct
    if i == 3 {arrayNameTeam.insert(game.presentationPlayer(),at: arrayNameTeam.count)}
    game.clearConsol()
    if i == 6 {arrayNameTeam.insert(game.presentationPlayer(),at: arrayNameTeam.count)}
    game.clearConsol()
}

// this part creat different fighter with the class Fighter
let P1_Fighter1 = Fighter(nom: arrayNameFighter[0],type: typePlayer(id: arrayFighterData[arrayChoiceFighter[0]]["id"]!),life: arrayFighterData[arrayChoiceFighter[0]]["life"]!,attack: arrayFighterData[arrayChoiceFighter[0]]["attack"]!,emojie:emojieFighter(id: arrayFighterData[arrayChoiceFighter[0]]["id"]!))
let P1_Fighter2 = Fighter(nom: arrayNameFighter[1],type: typePlayer(id: arrayFighterData[arrayChoiceFighter[1]]["id"]!),life: arrayFighterData[arrayChoiceFighter[1]]["life"]!,attack: arrayFighterData[arrayChoiceFighter[1]]["attack"]!,emojie:emojieFighter(id: arrayFighterData[arrayChoiceFighter[1]]["id"]!))
let P1_Fighter3 = Fighter(nom: arrayNameFighter[2],type: typePlayer(id: arrayFighterData[arrayChoiceFighter[2]]["id"]!),life: arrayFighterData[arrayChoiceFighter[2]]["life"]!,attack: arrayFighterData[arrayChoiceFighter[2]]["attack"]!,emojie:emojieFighter(id: arrayFighterData[arrayChoiceFighter[2]]["id"]!))
let P2_Fighter1 = Fighter(nom: arrayNameFighter[3],type: typePlayer(id: arrayFighterData[arrayChoiceFighter[3]]["id"]!),life: arrayFighterData[arrayChoiceFighter[3]]["life"]!,attack: arrayFighterData[arrayChoiceFighter[3]]["attack"]!,emojie:emojieFighter(id: arrayFighterData[arrayChoiceFighter[3]]["id"]!))
let P2_Fighter2 = Fighter(nom: arrayNameFighter[4],type: typePlayer(id: arrayFighterData[arrayChoiceFighter[4]]["id"]!),life: arrayFighterData[arrayChoiceFighter[4]]["life"]!,attack: arrayFighterData[arrayChoiceFighter[4]]["attack"]!,emojie:emojieFighter(id: arrayFighterData[arrayChoiceFighter[4]]["id"]!))
let P2_Fighter3 = Fighter(nom: arrayNameFighter[5],type: typePlayer(id: arrayFighterData[arrayChoiceFighter[5]]["id"]!),life: arrayFighterData[arrayChoiceFighter[5]]["life"]!,attack: arrayFighterData[arrayChoiceFighter[5]]["attack"]!,emojie:emojieFighter(id: arrayFighterData[arrayChoiceFighter[5]]["id"]!))

// this part it's for attribut fighters to players
let J1 = Player(namePlayer: arrayNameTeam[0], team: [P1_Fighter1,P1_Fighter2,P1_Fighter3])
let J2 = Player(namePlayer: arrayNameTeam[1], team: [P2_Fighter1,P2_Fighter2,P2_Fighter3])

// array that records action during the game
var arrayRecordGame = [String]()
// variables that recors the choise of fighters ou action
var choice: String?, choice2: String?, choiceAttack0rCare: String?

// loop which test is the pregramm is finish or not
while game.endGame(arrayRecordGame: arrayRecordGame) == false {
    
    game.clearConsol()
    game.printMenu(action : "presentation")
    
    // function which generate a random chest
    game.chest()
    
    if (game.turn % 2 != 0) { message(counter: 13) }
    else {message(counter: 14)}
    
    // function which determine if you want attack or care
    choiceAttack0rCare = game.choiceAttack0rCare()
    
    if Int(choiceAttack0rCare!)! == 1 {
        if game.turn % 2 != 0 {
            game.clearConsol()
            game.printMenu(action : "fight")
            print("select your fighter")
            choice = choiceFighter(action : 1)
            print("select your victim")
            choice2 = choiceFighter(action : 2)
            J1.team[Int(choice!)!].fight(victim: J2.team[Int(choice2!)!-3])
        }
        if game.turn % 2 == 0 {
            game.clearConsol()
            game.printMenu(action : "fight")
            print("select your fighter")
            choice = choiceFighter(action : 1)
            print("select your victim")
            choice2 = choiceFighter(action : 2)
            J2.team[Int(choice!)!].fight(victim: J1.team[Int(choice2!)!-3])
        }
    }
    
    if Int(choiceAttack0rCare!)! == 2 {
        game.clearConsol()
        game.printMenu(action : "care")
        print("which fighter do you want to heal ? ")
        choice = choiceFighter(action : 1)
        print("choice = \(choice!)")
        if game.turn % 2 != 0 {J1.team[Int(choice!)!].care()}
        if game.turn % 2 == 0 {J2.team[Int(choice!)!].care()}
        choice2 = String(Int(choice!)! + 3)
    }
    game.clearConsol()
    arrayRecordGame.insert(game.recordGame(action: Int(choiceAttack0rCare!)!, fighter1: J1.team[Int(choice!)!], fighter2: J2.team[Int(choice2!)!-3]),at: arrayRecordGame.count)
    game.turnMore()
}
