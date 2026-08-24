import Foundation

public struct CreatePostersRequestPoster: Codable, Hashable, Sendable {
    /// Whether the poster is active (defaults to true)
    public let active: Bool?
    /// ID of the loyalty card this poster links to
    public let cardId: Int
    /// Print size – one of: a4, a5, a6, letter
    public let paperSize: String?
    /// Primary brand color as a hex string (e.g. '#FF5733')
    public let primaryColor: String?
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
        paperSize: String? = nil,
        primaryColor: String? = nil,
        secondaryColor: String? = nil,
        textColor: String? = nil,
        title: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.active = active
        self.cardId = cardId
        self.paperSize = paperSize
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.textColor = textColor
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.cardId = try container.decode(Int.self, forKey: .cardId)
        self.paperSize = try container.decodeIfPresent(String.self, forKey: .paperSize)
        self.primaryColor = try container.decodeIfPresent(String.self, forKey: .primaryColor)
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
        try container.encodeIfPresent(self.paperSize, forKey: .paperSize)
        try container.encodeIfPresent(self.primaryColor, forKey: .primaryColor)
        try container.encodeIfPresent(self.secondaryColor, forKey: .secondaryColor)
        try container.encodeIfPresent(self.textColor, forKey: .textColor)
        try container.encodeIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case active
        case cardId = "card_id"
        case paperSize = "paper_size"
        case primaryColor = "primary_color"
        case secondaryColor = "secondary_color"
        case textColor = "text_color"
        case title
    }
}