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
