import Foundation

class Player {
    var namePlayer: String
    var team: [Fighter]
    init(namePlayer: String, team: [Fighter]) {
        self.namePlayer = namePlayer
        self.team = team
    }
}
