import Foundation

public struct UpdateCustomersResponse: Codable, Hashable, Sendable {
    /// Parent store ID
    public let accountId: Int
    /// Birthday as YYYY-MM-DD
    public let birthday: String
    /// ISO 8601 creation timestamp
    public let createdAt: String
    /// Cards this customer is enrolled on
    public let customerCards: [String]
    /// Email address, unique per store
    public let email: String
    /// Links to records in other systems
    public let externalReferences: [String]
    /// First name
    public let firstName: String
    /// Unique customer ID
    public let id: Int
    /// Last name
    public let lastName: String
    /// Free form per customer data
    public let metadata: [String: JSONValue]
    /// Phone number, unique per store
    public let phone: String
    /// Total stamps across every card
    public let stampCount: Int
    /// ISO 8601 last-update timestamp
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Int,
        birthday: String,
        createdAt: String,
        customerCards: [String],
        email: String,
        externalReferences: [String],
        firstName: String,
        id: Int,
        lastName: String,
        metadata: [String: JSONValue],
        phone: String,
        stampCount: Int,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.birthday = birthday
        self.createdAt = createdAt
        self.customerCards = customerCards
        self.email = email
        self.externalReferences = externalReferences
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.metadata = metadata
        self.phone = phone
        self.stampCount = stampCount
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Int.self, forKey: .accountId)
        self.birthday = try container.decode(String.self, forKey: .birthday)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customerCards = try container.decode([String].self, forKey: .customerCards)
        self.email = try container.decode(String.self, forKey: .email)
        self.externalReferences = try container.decode([String].self, forKey: .externalReferences)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.id = try container.decode(Int.self, forKey: .id)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.stampCount = try container.decode(Int.self, forKey: .stampCount)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.birthday, forKey: .birthday)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customerCards, forKey: .customerCards)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.externalReferences, forKey: .externalReferences)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.phone, forKey: .phone)
        try container.encode(self.stampCount, forKey: .stampCount)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case birthday
        case createdAt = "created_at"
        case customerCards = "customer_cards"
        case email
        case externalReferences = "external_references"
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case metadata
        case phone
        case stampCount = "stamp_count"
        case updatedAt = "updated_at"
    }
}