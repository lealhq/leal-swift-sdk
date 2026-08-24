import Foundation

public struct CreateRewardsRequestReward: Codable, Hashable, Sendable {
    /// Whether the reward is active and redeemable (defaults to true)
    public let active: Bool?
    /// ID of the loyalty card this reward belongs to
    public let cardId: Int
    /// Detailed description of the reward
    public let description: String?
    /// Display name of the reward (e.g. 'Free Coffee')
    public let name: String
    /// Display order position (lower numbers appear first)
    public let position: Int?
    /// Number of stamps needed to unlock this reward (must be > 0)
    public let stampsRequired: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        active: Bool? = nil,
        cardId: Int,
        description: String? = nil,
        name: String,
        position: Int? = nil,
        stampsRequired: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.active = active
        self.cardId = cardId
        self.description = description
        self.name = name
        self.position = position
        self.stampsRequired = stampsRequired
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.cardId = try container.decode(Int.self, forKey: .cardId)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.name = try container.decode(String.self, forKey: .name)
        self.position = try container.decodeIfPresent(Int.self, forKey: .position)
        self.stampsRequired = try container.decode(Int.self, forKey: .stampsRequired)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encode(self.cardId, forKey: .cardId)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.position, forKey: .position)
        try container.encode(self.stampsRequired, forKey: .stampsRequired)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case active
        case cardId = "card_id"
        case description
        case name
        case position
        case stampsRequired = "stamps_required"
    }
}