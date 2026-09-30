import Foundation

public struct PostApiV1AccountsAccountIdWebhookSubscriptionsIdTestResponse: Codable, Hashable, Sendable {
    /// True when your URL responded with a 2xx status
    public let delivered: Bool
    /// Why the delivery failed
    public let error: String
    /// The `webhook-id` of the test event
    public let eventId: String
    /// HTTP status your URL returned
    public let status: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        delivered: Bool,
        error: String,
        eventId: String,
        status: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.delivered = delivered
        self.error = error
        self.eventId = eventId
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.delivered = try container.decode(Bool.self, forKey: .delivered)
        self.error = try container.decode(String.self, forKey: .error)
        self.eventId = try container.decode(String.self, forKey: .eventId)
        self.status = try container.decode(Double.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.delivered, forKey: .delivered)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.eventId, forKey: .eventId)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case delivered
        case error
        case eventId = "event_id"
        case status
    }
}