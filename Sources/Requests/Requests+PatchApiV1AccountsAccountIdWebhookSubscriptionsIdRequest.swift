import Foundation

extension Requests {
    public struct PatchApiV1AccountsAccountIdWebhookSubscriptionsIdRequest: Codable, Hashable, Sendable {
        /// Your own label, up to 255 characters
        public let description: String?
        /// false to pause deliveries, true to resume them
        public let enabled: Bool?
        /// A single event. Same as `events` with one entry
        public let event: String?
        /// Replaces the list of events, or `["*"]` for every event
        public let events: [String]?
        /// `envelope` or `flat`
        public let payloadFormat: String?
        /// Public https URL that will receive the POST requests
        public let targetUrl: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            description: String? = nil,
            enabled: Bool? = nil,
            event: String? = nil,
            events: [String]? = nil,
            payloadFormat: String? = nil,
            targetUrl: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.description = description
            self.enabled = enabled
            self.event = event
            self.events = events
            self.payloadFormat = payloadFormat
            self.targetUrl = targetUrl
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
            self.event = try container.decodeIfPresent(String.self, forKey: .event)
            self.events = try container.decodeIfPresent([String].self, forKey: .events)
            self.payloadFormat = try container.decodeIfPresent(String.self, forKey: .payloadFormat)
            self.targetUrl = try container.decodeIfPresent(String.self, forKey: .targetUrl)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.description, forKey: .description)
            try container.encodeIfPresent(self.enabled, forKey: .enabled)
            try container.encodeIfPresent(self.event, forKey: .event)
            try container.encodeIfPresent(self.events, forKey: .events)
            try container.encodeIfPresent(self.payloadFormat, forKey: .payloadFormat)
            try container.encodeIfPresent(self.targetUrl, forKey: .targetUrl)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case description
            case enabled
            case event
            case events
            case payloadFormat = "payload_format"
            case targetUrl = "target_url"
        }
    }
}