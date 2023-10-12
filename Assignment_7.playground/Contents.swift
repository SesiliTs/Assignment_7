//1. შევქმნათ Class-ი SuperEnemy with properties: String name, Int hitPoints (ანუ სიცოცხლის რაოდენობა).
//სურვილისამებრ დაამატებ properties რომელიც მას აღწერს.


class SuperEnemy {
    let name: String
    var hitPoints: Int
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}

//2. შევქმნათ Superhero Protocol-ი.
//შემდეგი get only properties: String name, String alias, Bool isEvil და დიქშენარი (dictionary) superPowers [String: Int], სადაც String-ი არის სახელი და Int არის დაზიანება (damage).
//Method attack, რომელიც მიიღებს target SuperEnemy-ის და დააბრუნებს (return) Int-ს ანუ დარჩენილ სიცოცხლე.
//Method performSuperPower, რომელიც მიიღებს SuperEnemy-ის და დააბრუნებს (return) Int-ს, აქაც დარჩენილ სიცოცხლე.

protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String: Int] { get }
    
    func attack(target: SuperEnemy) -> Int
    
    mutating func performSuperPower(target: SuperEnemy) -> Int
}


//3. Superhero-ს extension-ი გავაკეთოთ სადაც შევქმნით method-ს რომელიც დაგვი-print-ავს ინფორმაციას სუპერ გმირზე და მის დარჩენილ superPower-ებზე.

extension Superhero {
    func info() {
        print("Superhero:", self.name, "Remaining superpowers:", self.superPowers.keys)
    }
}


//4. შევქმნათ რამოდენიმე სუპერგმირი Struct-ი რომელიც ჩვენს Superhero protocol-ს დააიმპლემენტირებს მაგ:
//
//struct SpiderMan: Superhero და ავღწეროთ protocol-ში არსებული ცვლადები და მეთოდები.
//
//attack მეთოდში -> 20-იდან 40-ამდე დავაგენერიროთ Int-ის რიცხვი და ეს დაგენერებული damage დავაკლოთ SuperEnemy-ს სიცოცხლეს და დარჩენილი სიცოცხლე დავაბრუნოთ( return).
//
//performSuperPower-ს შემთხვევაში -> დიქშენერიდან ერთ superPower-ს ვიღებთ და ვაკლებთ enemy-ს (სიცოცხლეს ვაკლებთ). ვშლით ამ დიქშენერიდან გამოყენებულ superPower-ს. გამოყენებული superPower-ი უნდა იყოს დარანდომებული. დარჩენილ enemy-ს სიცოცხლეს ვაბრუნებთ (return).


struct Batman: Superhero {
    var name = "Batman"
    
    var alias = "Bruce Wayne"
    
    var isEvil = false
    
    var superPowers = ["Martian arts": 40, " hand-to-hand combat": 30, "High Tech equipment": 40]
    
    func attack(target: SuperEnemy) -> Int {
        var damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        
        for _ in superPowers {
            var randomIndex = Int.random(in: 0..<superPowers.count)
            var dictKey = Array(superPowers)[randomIndex].key
            
            target.hitPoints -= Array(superPowers)[randomIndex].value
            superPowers.removeValue(forKey: dictKey)
        }
        
        if superPowers.isEmpty == true {
            attack(target: target)
        }
        
        return target.hitPoints
    }
}

struct MissMartian: Superhero {
    var name = "Miss Martian"
    
    var alias = "M'gann M'orzz"
    
    var isEvil = false
    
    var superPowers = ["Shapeshifting": 50, "Telepathy": 40, "Flight": 30]
    
    func attack(target: SuperEnemy) -> Int {
        var damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        for _ in superPowers {
            var randomIndex = Int.random(in: 0..<superPowers.count)
            var dictKey = Array(superPowers)[randomIndex].key
            
            target.hitPoints -= Array(superPowers)[randomIndex].value
            superPowers.removeValue(forKey: dictKey)
        }
        
        if superPowers.isEmpty == true {
            attack(target: target)
        }
        
        return target.hitPoints
    }
}

struct KidFlash: Superhero {
    var name = "Kid Flash"
    
    var alias = "Wally West"
    
    var isEvil = false
    
    var superPowers = ["Speed": 30, "Time Travel": 40]
    
    func attack(target: SuperEnemy) -> Int {
        var damage = Int.random(in: 20...40)
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        for _ in superPowers {
            var randomIndex = Int.random(in: 0..<superPowers.count)
            var dictKey = Array(superPowers)[randomIndex].key
            
            target.hitPoints -= Array(superPowers)[randomIndex].value
            superPowers.removeValue(forKey: dictKey)
        }
        
        if superPowers.isEmpty == true {
            attack(target: target)
        }
        
        return target.hitPoints
    }
    
}


//5. შევქმნათ class SuperheroSquad,
//რომელიც ჯენერიკ Superhero-s მიიღებს. მაგ: class SuperheroSquad<T: Superhero>.
//შევქმნათ array სუპერგმირების var superheroes: [T].
//შევქმნათ init-ი.
//შევქმნათ method რომელიც ჩამოგვითვლის სქვადში არსებულ სუპერგმირებს.


class SuperheroSquad {
    var superheroes = [Superhero]()
    
    init(superheroes: [Superhero]) {
        self.superheroes = superheroes
    }
    
    func allHeroes() {
        for hero in superheroes {
            print(hero.name)
        }
    }
    
}


var bane = SuperEnemy(name: "Bane", hitPoints: 450)
var batman = Batman()
var missMartian = MissMartian()
var kidFlash = KidFlash()


var superHeroSquad = SuperheroSquad(superheroes: [])
superHeroSquad.superheroes.append(batman)
superHeroSquad.superheroes.append(missMartian)
superHeroSquad.superheroes.append(kidFlash)

//6.ამ ყველაფრის მერე მოვაწყოთ ერთი ბრძოლა. 🤺🤜🏻🤛🏻
//შევქმნათ method simulateShowdown. ეს method იღებს სუპერგმირების სქვადს და იღებს SuperEnemy-ს.
//
//სანამ ჩვენი super enemy არ მოკვდება, ან კიდევ სანამ ჩვენ სუპერგმირებს არ დაუმთავრდებათ სუპერ შესაძლებლობები გავმართოთ ბრძოლა.
//
//ჩვენმა სუპერ გმირებმა რანდომად შეასრულონ superPowers, ყოველი შესრულებული superPowers-ი იშლება ამ გმირის ლისტიდან. თუ გმირს დაუმთავრდა superPowers, მას აქვს ბოლო 1 ჩვეულებრივი attack-ის განხორციელება (ამ attack განხორიციელება მხოლოდ ერთხელ შეუძლია როცა superPowers უმთავრდება).
//
//
//
//ბოლოს შედეგი დავბეჭდოთ, მოიგეს სუპერ გმირება თუ enemy-მ,
//
//ასევე კარგი იქნება თუ ორთაბრძოლის მიმდინარეობასაც დავბეჭდავთ და გამოვიყენებთ extension-ის მეთოდს.

func simulateShowdown(heroes: SuperheroSquad, enemy: SuperEnemy) {
    var remainingHeroes = [Superhero]()

    for var hero in heroes.superheroes {
           while hero.superPowers.isEmpty == false && enemy.hitPoints > 0 {
               hero.performSuperPower(target: enemy)
               hero.info()
               print(enemy.name, "hitpoints:", enemy.hitPoints)
           }
        if hero.superPowers.isEmpty == false {
            remainingHeroes.append(hero)
        }
       }
        
    if enemy.hitPoints <= 0 {
        print("Superhero Squad won, \(remainingHeroes.map{ $0.name }.joined(separator: ", ")) defeated \(enemy.name)")
       } else {
           print("\(enemy.name) defeated all the heroes")
       }
}

simulateShowdown(heroes: superHeroSquad, enemy: bane)
