import Foundation

extension Requests {
    public struct UpdatePostersRequest: Codable, Hashable, Sendable {
        public let poster: UpdatePostersRequestPoster
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            poster: UpdatePostersRequestPoster,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.poster = poster
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.poster = try container.decode(UpdatePostersRequestPoster.self, forKey: .poster)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.poster, forKey: .poster)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case poster
        }
    }
}