import Foundation

public struct StampCustomerCardsResponseReferredBy: Codable, Hashable, Sendable {
    /// The inviting customer's card
    public let customerCardId: Double
    /// The customer who invited them
    public let customerId: Int
    /// Referral ID
    public let referralId: Double
    /// ISO 8601 timestamp the referral paid out
    public let rewardedAt: String
    /// 'pending' until the store first stamps this card for a visit, then 'rewarded'
    public let status: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        customerCardId: Double,
        customerId: Int,
        referralId: Double,
        rewardedAt: String,
        status: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.customerCardId = customerCardId
        self.customerId = customerId
        self.referralId = referralId
        self.rewardedAt = rewardedAt
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customerCardId = try container.decode(Double.self, forKey: .customerCardId)
        self.customerId = try container.decode(Int.self, forKey: .customerId)
        self.referralId = try container.decode(Double.self, forKey: .referralId)
        self.rewardedAt = try container.decode(String.self, forKey: .rewardedAt)
        self.status = try container.decode(String.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.customerCardId, forKey: .customerCardId)
        try container.encode(self.customerId, forKey: .customerId)
        try container.encode(self.referralId, forKey: .referralId)
        try container.encode(self.rewardedAt, forKey: .rewardedAt)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case customerCardId = "customer_card_id"
        case customerId = "customer_id"
        case referralId = "referral_id"
        case rewardedAt = "rewarded_at"
        case status
    }
}