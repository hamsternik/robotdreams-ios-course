protocol FirstProtocol {}

protocol AnotherProtocol {
  var anotherProperty: String { get set }
}

struct SomeStructure: FirstProtocol, AnotherProtocol {
  let anotherProperty: String
}

class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
  var anotherProperty: String = ""
}
