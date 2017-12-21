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

