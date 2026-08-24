import Foundation

extension Requests {
    public struct CreateRewardsRequest: Codable, Hashable, Sendable {
        public let reward: CreateRewardsRequestReward
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            reward: CreateRewardsRequestReward,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.reward = reward
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.reward = try container.decode(CreateRewardsRequestReward.self, forKey: .reward)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.reward, forKey: .reward)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case reward
        }
    }
}