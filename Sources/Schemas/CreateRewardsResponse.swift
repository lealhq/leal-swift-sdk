import Foundation

public struct CreateRewardsResponse: Codable, Hashable, Sendable {
    /// Parent store ID
    public let accountId: Int
    /// Whether the reward can currently be redeemed
    public let active: Bool
    /// ID of the loyalty card this reward belongs to
    public let cardId: Int
    /// ISO 8601 creation timestamp
    public let createdAt: String
    /// Longer description of the reward
    public let description: String
    /// Unique reward ID
    public let id: Int
    /// Display name of the reward
    public let name: String
    /// Display order
    public let position: Int
    /// Stamps needed before the reward can be redeemed
    public let stampsRequired: Int
    /// ISO 8601 last-update timestamp
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Int,
        active: Bool,
        cardId: Int,
        createdAt: String,
        description: String,
        id: Int,
        name: String,
        position: Int,
        stampsRequired: Int,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.active = active
        self.cardId = cardId
        self.createdAt = createdAt
        self.description = description
        self.id = id
        self.name = name
        self.position = position
        self.stampsRequired = stampsRequired
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Int.self, forKey: .accountId)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.cardId = try container.decode(Int.self, forKey: .cardId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.description = try container.decode(String.self, forKey: .description)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.position = try container.decode(Int.self, forKey: .position)
        self.stampsRequired = try container.decode(Int.self, forKey: .stampsRequired)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.active, forKey: .active)
        try container.encode(self.cardId, forKey: .cardId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.position, forKey: .position)
        try container.encode(self.stampsRequired, forKey: .stampsRequired)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case active
        case cardId = "card_id"
        case createdAt = "created_at"
        case description
        case id
        case name
        case position
        case stampsRequired = "stamps_required"
        case updatedAt = "updated_at"
    }
}