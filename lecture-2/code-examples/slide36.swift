for animal in animals { 
  if animal is Sheep {
    print("Вот что говорит моя овца: \(animal.sayHello())") } 
  else if animal is Chicken {
    print("Вот что говорят мои куры: \(animal.sayHello())") } 
  else if animal is Pig {
    print("А вот и моя свинья: \(animal.sayHello())")
  }
}
