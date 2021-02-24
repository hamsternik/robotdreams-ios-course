class Chicken: FarmAnimal { 
  var numberOfEggs = 0
  override init() { 
    super.init() 
    name = "chicken" 
    numberOfLegs = 2
  }
  
  override func sayHello() -> String {
    return "Кудах-тах-тах"
  }
  
  override func description() { 
    super.description() 
    print("Я откладываю яйца.")
    if numberOfEggs == 1 {
      print("У меня есть для тебя одно яйцо.")
    } else if numberOfEggs > 0 {
      print("У меня есть для тебя \(numberOfEggs) яиц.")
    }
  }
  
  func layAnEgg() {
    numberOfEggs += 1
  }
  
  func giveUpEggs() -> Int { 
    let eggs = numberOfEggs numberOfEggs = 0 return eggs
  } 
}
