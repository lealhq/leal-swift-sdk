import Foundation

public struct ListPostersResponseItem: Codable, Hashable, Sendable {
    /// Parent store ID
    public let accountId: Int
    /// Whether the public signup URL is live
    public let active: Bool
    /// Loyalty card customers are signed up to
    public let cardId: Int
    /// ISO 8601 creation timestamp
    public let createdAt: String
    /// URL of the on screen version of the poster
    public let displayUrl: String
    /// Unique poster ID
    public let id: Int
    /// Paper size the poster is laid out for
    public let paperSize: String
    /// Hex colour for the poster background
    public let primaryColor: String
    /// URL encoded in the QR code
    public let qrCodeUrl: String
    /// Hex accent colour
    public let secondaryColor: String
    /// Public URL the QR code points at
    public let signupUrl: String
    /// Hex colour for poster text
    public let textColor: String
    /// Heading printed on the poster
    public let title: String
    /// ISO 8601 last-update timestamp
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Int,
        active: Bool,
        cardId: Int,
        createdAt: String,
        displayUrl: String,
        id: Int,
        paperSize: String,
        primaryColor: String,
        qrCodeUrl: String,
        secondaryColor: String,
        signupUrl: String,
        textColor: String,
        title: String,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.active = active
        self.cardId = cardId
        self.createdAt = createdAt
        self.displayUrl = displayUrl
        self.id = id
        self.paperSize = paperSize
        self.primaryColor = primaryColor
        self.qrCodeUrl = qrCodeUrl
        self.secondaryColor = secondaryColor
        self.signupUrl = signupUrl
        self.textColor = textColor
        self.title = title
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Int.self, forKey: .accountId)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.cardId = try container.decode(Int.self, forKey: .cardId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.displayUrl = try container.decode(String.self, forKey: .displayUrl)
        self.id = try container.decode(Int.self, forKey: .id)
        self.paperSize = try container.decode(String.self, forKey: .paperSize)
        self.primaryColor = try container.decode(String.self, forKey: .primaryColor)
        self.qrCodeUrl = try container.decode(String.self, forKey: .qrCodeUrl)
        self.secondaryColor = try container.decode(String.self, forKey: .secondaryColor)
        self.signupUrl = try container.decode(String.self, forKey: .signupUrl)
        self.textColor = try container.decode(String.self, forKey: .textColor)
        self.title = try container.decode(String.self, forKey: .title)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.active, forKey: .active)
        try container.encode(self.cardId, forKey: .cardId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.displayUrl, forKey: .displayUrl)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paperSize, forKey: .paperSize)
        try container.encode(self.primaryColor, forKey: .primaryColor)
        try container.encode(self.qrCodeUrl, forKey: .qrCodeUrl)
        try container.encode(self.secondaryColor, forKey: .secondaryColor)
        try container.encode(self.signupUrl, forKey: .signupUrl)
        try container.encode(self.textColor, forKey: .textColor)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case active
        case cardId = "card_id"
        case createdAt = "created_at"
        case displayUrl = "display_url"
        case id
        case paperSize = "paper_size"
        case primaryColor = "primary_color"
        case qrCodeUrl = "qr_code_url"
        case secondaryColor = "secondary_color"
        case signupUrl = "signup_url"
        case textColor = "text_color"
        case title
        case updatedAt = "updated_at"
    }
}