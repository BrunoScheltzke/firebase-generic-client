// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


struct PersonKeys {
	static let tableName = "Person"
	static let firebaseId = "firebaseId"
	static let name = "name"
	static let lastName = "lastName"
}

extension Person: Makeable {
	func toDictionary() -> [String: Any] {
		var dict: [String: Any] = [:]
		dict[PersonKeys.name] = name
		dict[PersonKeys.lastName] = lastName
		dict[PersonKeys.firebaseId] = self.firebaseId
		return dict
	}

	static func make(from dictionary: [String: Any]) -> Person {
		var object = self.init()
		object.firebaseId = dictionary[PersonKeys.firebaseId] as? String
		object.name = dictionary[PersonKeys.name] as! String
		object.lastName = dictionary[PersonKeys.lastName] as! String
		return object
	}
}