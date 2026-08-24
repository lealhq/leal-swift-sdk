import Foundation

public struct RedeemCustomerCardsResponse: Codable, Hashable, Sendable {
    public let redemption: RedeemCustomerCardsResponseRedemption
    /// True when the reward was redeemed
    public let success: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        redemption: RedeemCustomerCardsResponseRedemption,
        success: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.redemption = redemption
        self.success = success
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.redemption = try container.decode(RedeemCustomerCardsResponseRedemption.self, forKey: .redemption)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.redemption, forKey: .redemption)
        try container.encode(self.success, forKey: .success)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case redemption
        case success
    }
}