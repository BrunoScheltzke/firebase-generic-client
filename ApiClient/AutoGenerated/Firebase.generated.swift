// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


struct DogKeys {
	static let tableName = "Dog"
	static let firebaseId = "firebaseId"
	static let name = "name"
}

extension Dog: Makeable {
	func toDictionary() -> [String: Any] {
		var dict: [String: Any] = [:]
		dict[DogKeys.name] = name
		dict[DogKeys.firebaseId] = self.firebaseId
		return dict
	}
	func update(other: Dog) {
		self.isCompleted = true
		self.name = other.name
	}

	static func make(from dictionary: [String: Any]) -> Dog {
		let object = self.init()
		object.firebaseId = dictionary[DogKeys.firebaseId] as! String
		object.isCompleted = true
		object.name = dictionary[DogKeys.name] as! String
		return object
	}
}


final class DogManager: FirebaseCrudable {
	typealias Model = Dog
    static let shared = DogManager()
}

struct PersonKeys {
	static let tableName = "Person"
	static let firebaseId = "firebaseId"
	static let name = "name"
	static let lastName = "lastName"
	static let dog = "dog"
}

extension Person: Makeable {
	func toDictionary() -> [String: Any] {
		var dict: [String: Any] = [:]
		dict[PersonKeys.name] = name
		dict[PersonKeys.lastName] = lastName
		dict[PersonKeys.dog] = dog.firebaseId
		dict[PersonKeys.firebaseId] = self.firebaseId
		return dict
	}
	func update(other: Person) {
		self.isCompleted = true
		self.name = other.name
		self.lastName = other.lastName
		self.dog = other.dog
	}

	static func make(from dictionary: [String: Any]) -> Person {
		let object = self.init()
		object.firebaseId = dictionary[PersonKeys.firebaseId] as! String
		object.isCompleted = true
		object.name = dictionary[PersonKeys.name] as! String
		object.lastName = dictionary[PersonKeys.lastName] as! String
		let element = Dog()
		element.firebaseId = dictionary[PersonKeys.dog] as! String
		object.dog = element
		return object
	}
}


final class PersonManager: FirebaseCrudable {
	typealias Model = Person
    static let shared = PersonManager()
}

struct PetShopKeys {
	static let tableName = "PetShop"
	static let firebaseId = "firebaseId"
	static let name = "name"
	static let clients = "clients"
}

extension PetShop: Makeable {
	func toDictionary() -> [String: Any] {
		var dict: [String: Any] = [:]
		dict[PetShopKeys.name] = name
		dict[PetShopKeys.clients] = clients
		dict[PetShopKeys.firebaseId] = self.firebaseId
		return dict
	}
	mutating func update(other: PetShop) {
		self = other
	}

	static func make(from dictionary: [String: Any]) -> PetShop {
		var object = self.init()
		object.firebaseId = dictionary[PetShopKeys.firebaseId] as! String
		object.isCompleted = true
		object.name = dictionary[PetShopKeys.name] as! String
		let clientsRefs = dictionary[PetShopKeys.clients] as! [String: Bool]
		object.clients = clientsRefs.map { (reference) in
			let element = Person()
			element.firebaseId = reference.key
			return element
		}
		return object
	}
}

extension PetShop {
	init() {
	self.firebaseId = String()
	self.isCompleted = Bool()
	self.name = String()
	self.clients = [Person]()
	}
}

final class PetShopManager: FirebaseCrudable {
	typealias Model = PetShop
    static let shared = PetShopManager()
}

