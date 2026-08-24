import Foundation

public struct UpdateRewardsRequestReward: Codable, Hashable, Sendable {
    /// Whether the reward is active and redeemable
    public let active: Bool?
    /// Detailed description of the reward
    public let description: String?
    /// Display name of the reward
    public let name: String?
    /// Display order position
    public let position: Int?
    /// Number of stamps needed to unlock this reward (must be > 0)
    public let stampsRequired: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        active: Bool? = nil,
        description: String? = nil,
        name: String? = nil,
        position: Int? = nil,
        stampsRequired: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.active = active
        self.description = description
        self.name = name
        self.position = position
        self.stampsRequired = stampsRequired
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.position = try container.decodeIfPresent(Int.self, forKey: .position)
        self.stampsRequired = try container.decodeIfPresent(Int.self, forKey: .stampsRequired)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.position, forKey: .position)
        try container.encodeIfPresent(self.stampsRequired, forKey: .stampsRequired)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case active
        case description
        case name
        case position
        case stampsRequired = "stamps_required"
    }
}