import Foundation

extension Requests {
    public struct CreateLocationsRequest: Codable, Hashable, Sendable {
        public let location: CreateLocationsRequestLocation
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            location: CreateLocationsRequestLocation,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.location = location
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.location = try container.decode(CreateLocationsRequestLocation.self, forKey: .location)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.location, forKey: .location)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case location
        }
    }
}