import Foundation

extension Requests {
    public struct StampCustomerCardsRequest: Codable, Hashable, Sendable {
        /// When true, stamp changes bypass notifications
        public let skipNotifications: Bool?
        /// Number of stamps to add (e.g. 1, 3)
        public let stamps: Int
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            skipNotifications: Bool? = nil,
            stamps: Int,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.skipNotifications = skipNotifications
            self.stamps = stamps
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.skipNotifications = try container.decodeIfPresent(Bool.self, forKey: .skipNotifications)
            self.stamps = try container.decode(Int.self, forKey: .stamps)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.skipNotifications, forKey: .skipNotifications)
            try container.encode(self.stamps, forKey: .stamps)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case skipNotifications = "skip_notifications"
            case stamps
        }
    }
}