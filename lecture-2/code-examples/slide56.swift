protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("С Днем Рождения, \(celebrator.name)! Тебе уже \(celebrator.age)!")
}

let birthdayPerson = Person(name: "Сашка", age: 21)
wishHappyBirthday(to: birthdayPerson)
// Выведет "С Днем Рождения, Сашка! Тебе уже 21!"
