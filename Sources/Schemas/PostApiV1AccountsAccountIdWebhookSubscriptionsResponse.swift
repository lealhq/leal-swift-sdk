import Foundation

public struct PostApiV1AccountsAccountIdWebhookSubscriptionsResponse: Codable, Hashable, Sendable {
    /// Parent store ID
    public let accountId: Int
    /// ISO 8601 creation timestamp
    public let createdAt: String
    /// Your own label for the subscription
    public let description: String
    /// ISO 8601 time the subscription was disabled
    public let disabledAt: String
    /// `disabled_by_user`, `failing` or `blocked_address`
    public let disabledReason: String
    /// Whether events are being delivered
    public let enabled: Bool
    /// The event, when there is exactly one (kept for older integrations)
    public let event: String
    /// Events delivered to this URL, or `["*"]` for every event
    public let events: [String]
    /// Unique subscription ID
    public let id: Int
    /// ISO 8601 time of the most recent delivery attempt
    public let lastDeliveryAt: String
    /// Why the most recent attempt failed
    public let lastDeliveryError: String
    /// HTTP status your URL returned on the most recent attempt
    public let lastDeliveryStatus: Double
    /// `envelope` (default) or `flat` (the bare data object, used by Zapier)
    public let payloadFormat: String
    /// Signing secret (`whsec_...`). Use it to verify the `webhook-signature` header.
    public let secret: String
    /// URL that receives the POST requests
    public let targetUrl: String
    /// ISO 8601 last-update timestamp
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Int,
        createdAt: String,
        description: String,
        disabledAt: String,
        disabledReason: String,
        enabled: Bool,
        event: String,
        events: [String],
        id: Int,
        lastDeliveryAt: String,
        lastDeliveryError: String,
        lastDeliveryStatus: Double,
        payloadFormat: String,
        secret: String,
        targetUrl: String,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.createdAt = createdAt
        self.description = description
        self.disabledAt = disabledAt
        self.disabledReason = disabledReason
        self.enabled = enabled
        self.event = event
        self.events = events
        self.id = id
        self.lastDeliveryAt = lastDeliveryAt
        self.lastDeliveryError = lastDeliveryError
        self.lastDeliveryStatus = lastDeliveryStatus
        self.payloadFormat = payloadFormat
        self.secret = secret
        self.targetUrl = targetUrl
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Int.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.description = try container.decode(String.self, forKey: .description)
        self.disabledAt = try container.decode(String.self, forKey: .disabledAt)
        self.disabledReason = try container.decode(String.self, forKey: .disabledReason)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.event = try container.decode(String.self, forKey: .event)
        self.events = try container.decode([String].self, forKey: .events)
        self.id = try container.decode(Int.self, forKey: .id)
        self.lastDeliveryAt = try container.decode(String.self, forKey: .lastDeliveryAt)
        self.lastDeliveryError = try container.decode(String.self, forKey: .lastDeliveryError)
        self.lastDeliveryStatus = try container.decode(Double.self, forKey: .lastDeliveryStatus)
        self.payloadFormat = try container.decode(String.self, forKey: .payloadFormat)
        self.secret = try container.decode(String.self, forKey: .secret)
        self.targetUrl = try container.decode(String.self, forKey: .targetUrl)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.disabledAt, forKey: .disabledAt)
        try container.encode(self.disabledReason, forKey: .disabledReason)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encode(self.event, forKey: .event)
        try container.encode(self.events, forKey: .events)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastDeliveryAt, forKey: .lastDeliveryAt)
        try container.encode(self.lastDeliveryError, forKey: .lastDeliveryError)
        try container.encode(self.lastDeliveryStatus, forKey: .lastDeliveryStatus)
        try container.encode(self.payloadFormat, forKey: .payloadFormat)
        try container.encode(self.secret, forKey: .secret)
        try container.encode(self.targetUrl, forKey: .targetUrl)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case createdAt = "created_at"
        case description
        case disabledAt = "disabled_at"
        case disabledReason = "disabled_reason"
        case enabled
        case event
        case events
        case id
        case lastDeliveryAt = "last_delivery_at"
        case lastDeliveryError = "last_delivery_error"
        case lastDeliveryStatus = "last_delivery_status"
        case payloadFormat = "payload_format"
        case secret
        case targetUrl = "target_url"
        case updatedAt = "updated_at"
    }
}