class FarmAnimal {
  var name = "домашнее животное"
  var numberOfLegs = 4

  func sayHello() -> String {
    return "Привет,я домашнее животное!"
  }

  func description() {
    print("Я \(name), и у меня \(numberOfLegs) ног.")
  }
}

class Sheep: FarmAnimal {
  override init() {
    super.init()
    name = "Овца"
  }

  override func sayHello() -> String {
    return "Бе-е-е"
  }

  override func description() {
    super.description()
    print("Из моей шерсти делают одеяла.")
  }
}

let aSheep = Sheep()
aSheep.sayHello()
aSheep.description()
