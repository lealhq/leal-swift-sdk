import Foundation

public struct ListCustomerCardsResponseItem: Codable, Hashable, Sendable {
    /// Link to add or view the pass in Apple Wallet
    public let appleWalletUrl: String
    /// Loyalty card template ID
    public let cardId: Int
    /// Name of the loyalty card
    public let cardName: String
    /// ISO 8601 creation timestamp
    public let createdAt: String
    /// Link to add or view the pass in Google Wallet
    public let googleWalletUrl: String
    /// Customer card ID
    public let id: Int
    /// ISO 8601 timestamp the card was issued
    public let issuedAt: String
    /// Whether the wallet pass has been installed
    public let passInstalled: Bool
    /// Completion towards the next reward, 0 to 100
    public let progressPercentage: Double
    /// Stamps collected so far
    public let stampsCount: Int
    /// Stamps still needed to complete the card
    public let stampsRemaining: Int
    /// Current state of the customer card
    public let status: String
    /// ISO 8601 last-update timestamp
    public let updatedAt: String
    /// Public identifier used in wallet pass URLs
    public let uuid: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appleWalletUrl: String,
        cardId: Int,
        cardName: String,
        createdAt: String,
        googleWalletUrl: String,
        id: Int,
        issuedAt: String,
        passInstalled: Bool,
        progressPercentage: Double,
        stampsCount: Int,
        stampsRemaining: Int,
        status: String,
        updatedAt: String,
        uuid: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appleWalletUrl = appleWalletUrl
        self.cardId = cardId
        self.cardName = cardName
        self.createdAt = createdAt
        self.googleWalletUrl = googleWalletUrl
        self.id = id
        self.issuedAt = issuedAt
        self.passInstalled = passInstalled
        self.progressPercentage = progressPercentage
        self.stampsCount = stampsCount
        self.stampsRemaining = stampsRemaining
        self.status = status
        self.updatedAt = updatedAt
        self.uuid = uuid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appleWalletUrl = try container.decode(String.self, forKey: .appleWalletUrl)
        self.cardId = try container.decode(Int.self, forKey: .cardId)
        self.cardName = try container.decode(String.self, forKey: .cardName)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.googleWalletUrl = try container.decode(String.self, forKey: .googleWalletUrl)
        self.id = try container.decode(Int.self, forKey: .id)
        self.issuedAt = try container.decode(String.self, forKey: .issuedAt)
        self.passInstalled = try container.decode(Bool.self, forKey: .passInstalled)
        self.progressPercentage = try container.decode(Double.self, forKey: .progressPercentage)
        self.stampsCount = try container.decode(Int.self, forKey: .stampsCount)
        self.stampsRemaining = try container.decode(Int.self, forKey: .stampsRemaining)
        self.status = try container.decode(String.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.appleWalletUrl, forKey: .appleWalletUrl)
        try container.encode(self.cardId, forKey: .cardId)
        try container.encode(self.cardName, forKey: .cardName)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.googleWalletUrl, forKey: .googleWalletUrl)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issuedAt, forKey: .issuedAt)
        try container.encode(self.passInstalled, forKey: .passInstalled)
        try container.encode(self.progressPercentage, forKey: .progressPercentage)
        try container.encode(self.stampsCount, forKey: .stampsCount)
        try container.encode(self.stampsRemaining, forKey: .stampsRemaining)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.uuid, forKey: .uuid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appleWalletUrl = "apple_wallet_url"
        case cardId = "card_id"
        case cardName = "card_name"
        case createdAt = "created_at"
        case googleWalletUrl = "google_wallet_url"
        case id
        case issuedAt = "issued_at"
        case passInstalled = "pass_installed"
        case progressPercentage = "progress_percentage"
        case stampsCount = "stamps_count"
        case stampsRemaining = "stamps_remaining"
        case status
        case updatedAt = "updated_at"
        case uuid
    }
}