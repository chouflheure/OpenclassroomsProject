import Foundation

// class fighter that generat object fighter with all informations
class Fighter {
    var nom : String
    var type: String
    var life: Int
    var attack: Int
    var emojie: String
    init(nom: String, type:String, life: Int, attack: Int, emojie: String){
        self.nom = nom
        self.type = type
        self.life = life
        self.attack = attack
        self.emojie = emojie
    }
    
    // function call during a fight
    func fight(victim: Fighter) {
        victim.life -= self.attack
        if victim.life <= 0 {
            victim.life = 0
        }
    }
    func care(){
        self.life += 30
    }
    
    func coffreAdd(power:Int){
        self.attack = power
    }
}
