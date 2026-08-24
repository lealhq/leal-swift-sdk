import Foundation

extension Requests {
    public struct UpdateCardsRequest: Codable, Hashable, Sendable {
        public let card: UpdateCardsRequestCard
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            card: UpdateCardsRequestCard,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.card = card
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.card = try container.decode(UpdateCardsRequestCard.self, forKey: .card)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.card, forKey: .card)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case card
        }
    }
}