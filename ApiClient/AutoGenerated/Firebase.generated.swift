// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// ------- Person related generated code ----------------- //

struct PersonKeys {
	static let tableName = "Person"
	static let firebaseId = "firebaseId"
	static let name = "name"
	static let lastName = "lastName"
	static let pets = "pets"
}

extension Person: Makeable {
	func toDictionary() -> [String: Any] {
		var dict: [String: Any] = [:]
		dict[PersonKeys.name] = name
		dict[PersonKeys.lastName] = lastName
		var petsRefs: [String: Bool] = [:]
		pets.forEach{ petsRefs[$0.firebaseId] = true }
		dict[PersonKeys.pets] = petsRefs
		dict[PersonKeys.firebaseId] = self.firebaseId
		return dict
	}
	func update(other: Person) {
		self.isCompleted = true
		self.name = other.name
		self.lastName = other.lastName
		self.pets = other.pets
	}

	static func make(from dictionary: [String: Any]) -> Person {
		let object = self.init()
		object.firebaseId = dictionary[PersonKeys.firebaseId] as! String
		object.isCompleted = true
		object.name = dictionary[PersonKeys.name] as! String
		object.lastName = dictionary[PersonKeys.lastName] as! String
		let petsRefs = dictionary[PersonKeys.pets] as? [String: Bool] ?? [:]
		object.pets = petsRefs.map { (reference) in
			var element = Pet()
			element.firebaseId = reference.key
			return element
		}
		return object
	}
}


final class PersonManager: FirebaseCrudable {
	typealias Model = Person
    static let shared = PersonManager()
}

// ------- End of Person code ----------------- //


// ------- Pet related generated code ----------------- //

struct PetKeys {
	static let tableName = "Pet"
	static let firebaseId = "firebaseId"
	static let name = "name"
	static let age = "age"
	static let petType = "petType"
}

extension Pet: Makeable {
	func toDictionary() -> [String: Any] {
		var dict: [String: Any] = [:]
		dict[PetKeys.name] = name
		dict[PetKeys.age] = age
		dict[PetKeys.petType] = petType
		dict[PetKeys.firebaseId] = self.firebaseId
		return dict
	}
	func update(other: Pet) {
		self.isCompleted = true
		self.name = other.name
		self.age = other.age
		self.petType = other.petType
	}

	static func make(from dictionary: [String: Any]) -> Pet {
		let object = self.init()
		object.firebaseId = dictionary[PetKeys.firebaseId] as! String
		object.isCompleted = true
		object.name = dictionary[PetKeys.name] as! String
		object.age = dictionary[PetKeys.age] as! Int
		object.petType = dictionary[PetKeys.petType] as! String
		return object
	}
}


final class PetManager: FirebaseCrudable {
	typealias Model = Pet
    static let shared = PetManager()
}

// ------- End of Pet code ----------------- //

