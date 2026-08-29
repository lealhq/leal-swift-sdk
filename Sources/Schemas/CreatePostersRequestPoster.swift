import Foundation

public struct CreatePostersRequestPoster: Codable, Hashable, Sendable {
    /// Whether the poster is active (defaults to true)
    public let active: Bool?
    /// ID of the loyalty card this poster links to
    public let cardId: Int
    /// Which contact fields appear on the public signup form
    public let contactCollectionMode: String?
    /// Minimum customer age required for signup. Requires require_birthday to be true.
    public let minimumAge: Double?
    /// Print size – one of: a4, a5, a6, letter
    public let paperSize: String?
    /// Primary brand color as a hex string (e.g. '#FF5733')
    public let primaryColor: String?
    /// Whether date of birth is required on the public signup form
    public let requireBirthday: Bool?
    /// Whether email is required when it is collected
    public let requireEmail: Bool?
    /// Whether phone number is required when it is collected
    public let requirePhone: Bool?
    /// Secondary brand color as a hex string
    public let secondaryColor: String?
    /// Text color as a hex string
    public let textColor: String?
    /// Headline text displayed on the poster
    public let title: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        active: Bool? = nil,
        cardId: Int,
        contactCollectionMode: String? = nil,
        minimumAge: Double? = nil,
        paperSize: String? = nil,
        primaryColor: String? = nil,
        requireBirthday: Bool? = nil,
        requireEmail: Bool? = nil,
        requirePhone: Bool? = nil,
        secondaryColor: String? = nil,
        textColor: String? = nil,
        title: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.active = active
        self.cardId = cardId
        self.contactCollectionMode = contactCollectionMode
        self.minimumAge = minimumAge
        self.paperSize = paperSize
        self.primaryColor = primaryColor
        self.requireBirthday = requireBirthday
        self.requireEmail = requireEmail
        self.requirePhone = requirePhone
        self.secondaryColor = secondaryColor
        self.textColor = textColor
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.cardId = try container.decode(Int.self, forKey: .cardId)
        self.contactCollectionMode = try container.decodeIfPresent(String.self, forKey: .contactCollectionMode)
        self.minimumAge = try container.decodeIfPresent(Double.self, forKey: .minimumAge)
        self.paperSize = try container.decodeIfPresent(String.self, forKey: .paperSize)
        self.primaryColor = try container.decodeIfPresent(String.self, forKey: .primaryColor)
        self.requireBirthday = try container.decodeIfPresent(Bool.self, forKey: .requireBirthday)
        self.requireEmail = try container.decodeIfPresent(Bool.self, forKey: .requireEmail)
        self.requirePhone = try container.decodeIfPresent(Bool.self, forKey: .requirePhone)
        self.secondaryColor = try container.decodeIfPresent(String.self, forKey: .secondaryColor)
        self.textColor = try container.decodeIfPresent(String.self, forKey: .textColor)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.active, forKey: .active)
        try container.encode(self.cardId, forKey: .cardId)
        try container.encodeIfPresent(self.contactCollectionMode, forKey: .contactCollectionMode)
        try container.encodeIfPresent(self.minimumAge, forKey: .minimumAge)
        try container.encodeIfPresent(self.paperSize, forKey: .paperSize)
        try container.encodeIfPresent(self.primaryColor, forKey: .primaryColor)
        try container.encodeIfPresent(self.requireBirthday, forKey: .requireBirthday)
        try container.encodeIfPresent(self.requireEmail, forKey: .requireEmail)
        try container.encodeIfPresent(self.requirePhone, forKey: .requirePhone)
        try container.encodeIfPresent(self.secondaryColor, forKey: .secondaryColor)
        try container.encodeIfPresent(self.textColor, forKey: .textColor)
        try container.encodeIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case active
        case cardId = "card_id"
        case contactCollectionMode = "contact_collection_mode"
        case minimumAge = "minimum_age"
        case paperSize = "paper_size"
        case primaryColor = "primary_color"
        case requireBirthday = "require_birthday"
        case requireEmail = "require_email"
        case requirePhone = "require_phone"
        case secondaryColor = "secondary_color"
        case textColor = "text_color"
        case title
    }
}