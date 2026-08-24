import Foundation

public struct CreateCustomersRequestCustomer: Codable, Hashable, Sendable {
    /// Customer's birthday (YYYY-MM-DD)
    public let birthday: String?
    /// Customer's email address (unique per store; required if phone is blank)
    public let email: String?
    /// Array of `{source, external_id, metadata}` objects linking this customer to records in external systems
    public let externalReferences: [String]?
    /// Customer's first name
    public let firstName: String
    /// Customer's last name
    public let lastName: String?
    /// Free-form JSON object of additional per-customer attributes
    public let metadata: [String: JSONValue]?
    /// Customer's phone number (unique per store; required if email is blank)
    public let phone: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        birthday: String? = nil,
        email: String? = nil,
        externalReferences: [String]? = nil,
        firstName: String,
        lastName: String? = nil,
        metadata: [String: JSONValue]? = nil,
        phone: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.birthday = birthday
        self.email = email
        self.externalReferences = externalReferences
        self.firstName = firstName
        self.lastName = lastName
        self.metadata = metadata
        self.phone = phone
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.birthday = try container.decodeIfPresent(String.self, forKey: .birthday)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.externalReferences = try container.decodeIfPresent([String].self, forKey: .externalReferences)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.birthday, forKey: .birthday)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.externalReferences, forKey: .externalReferences)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.phone, forKey: .phone)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case birthday
        case email
        case externalReferences = "external_references"
        case firstName = "first_name"
        case lastName = "last_name"
        case metadata
        case phone
    }
}