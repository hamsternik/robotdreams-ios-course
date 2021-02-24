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
