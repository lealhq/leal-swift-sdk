import Foundation

extension Requests {
    public struct RedeemCustomerCardsRequest: Codable, Hashable, Sendable {
        /// Reward ID to redeem
        public let rewardId: Int
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            rewardId: Int,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.rewardId = rewardId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.rewardId = try container.decode(Int.self, forKey: .rewardId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.rewardId, forKey: .rewardId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case rewardId = "reward_id"
        }
    }
}