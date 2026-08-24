import Foundation

public struct RedeemCustomerCardsResponseRedemption: Codable, Hashable, Sendable {
    /// Redemption ID
    public let id: Int
    /// ISO 8601 timestamp of the redemption
    public let redeemedAt: String
    /// Reward that was redeemed
    public let rewardId: Int
    /// Display name of the reward
    public let rewardName: String
    /// Stamps left on the card afterwards
    public let stampsRemaining: Int
    /// Stamps deducted from the card
    public let stampsSpent: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: Int,
        redeemedAt: String,
        rewardId: Int,
        rewardName: String,
        stampsRemaining: Int,
        stampsSpent: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.redeemedAt = redeemedAt
        self.rewardId = rewardId
        self.rewardName = rewardName
        self.stampsRemaining = stampsRemaining
        self.stampsSpent = stampsSpent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.redeemedAt = try container.decode(String.self, forKey: .redeemedAt)
        self.rewardId = try container.decode(Int.self, forKey: .rewardId)
        self.rewardName = try container.decode(String.self, forKey: .rewardName)
        self.stampsRemaining = try container.decode(Int.self, forKey: .stampsRemaining)
        self.stampsSpent = try container.decode(Int.self, forKey: .stampsSpent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.redeemedAt, forKey: .redeemedAt)
        try container.encode(self.rewardId, forKey: .rewardId)
        try container.encode(self.rewardName, forKey: .rewardName)
        try container.encode(self.stampsRemaining, forKey: .stampsRemaining)
        try container.encode(self.stampsSpent, forKey: .stampsSpent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case redeemedAt = "redeemed_at"
        case rewardId = "reward_id"
        case rewardName = "reward_name"
        case stampsRemaining = "stamps_remaining"
        case stampsSpent = "stamps_spent"
    }
}