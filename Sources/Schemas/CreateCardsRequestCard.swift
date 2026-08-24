import Foundation

public struct CreateCardsRequestCard: Codable, Hashable, Sendable {
    /// Hex colour for the card background (e.g. '#6B4226')
    public let cardColor: String?
    /// Optional header text displayed on the card
    public let headerText: String?
    /// Number of stamps pre-filled on new customer cards (must be >= 0 and < stamps_required)
    public let initialStamps: Int?
    /// Card name (e.g. 'Coffee Loyalty Card')
    public let name: String
    /// Hex colour for stamp backgrounds
    public let stampBackgroundColor: String?
    /// Hex colour for stamp icons
    public let stampColor: String?
    /// Stamp icon identifier
    public let stampIcon: String?
    /// Number of stamps needed to complete the card (1–21)
    public let stampsRequired: Int?
    /// Hex colour for the strip (used when strip_type is 'color')
    public let stripColor: String?
    /// Preset strip image identifier (used when strip_type is 'preset')
    public let stripPreset: String?
    /// Strip image type
    public let stripType: String?
    /// Hex colour for card text
    public let textColor: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardColor: String? = nil,
        headerText: String? = nil,
        initialStamps: Int? = nil,
        name: String,
        stampBackgroundColor: String? = nil,
        stampColor: String? = nil,
        stampIcon: String? = nil,
        stampsRequired: Int? = nil,
        stripColor: String? = nil,
        stripPreset: String? = nil,
        stripType: String? = nil,
        textColor: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardColor = cardColor
        self.headerText = headerText
        self.initialStamps = initialStamps
        self.name = name
        self.stampBackgroundColor = stampBackgroundColor
        self.stampColor = stampColor
        self.stampIcon = stampIcon
        self.stampsRequired = stampsRequired
        self.stripColor = stripColor
        self.stripPreset = stripPreset
        self.stripType = stripType
        self.textColor = textColor
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardColor = try container.decodeIfPresent(String.self, forKey: .cardColor)
        self.headerText = try container.decodeIfPresent(String.self, forKey: .headerText)
        self.initialStamps = try container.decodeIfPresent(Int.self, forKey: .initialStamps)
        self.name = try container.decode(String.self, forKey: .name)
        self.stampBackgroundColor = try container.decodeIfPresent(String.self, forKey: .stampBackgroundColor)
        self.stampColor = try container.decodeIfPresent(String.self, forKey: .stampColor)
        self.stampIcon = try container.decodeIfPresent(String.self, forKey: .stampIcon)
        self.stampsRequired = try container.decodeIfPresent(Int.self, forKey: .stampsRequired)
        self.stripColor = try container.decodeIfPresent(String.self, forKey: .stripColor)
        self.stripPreset = try container.decodeIfPresent(String.self, forKey: .stripPreset)
        self.stripType = try container.decodeIfPresent(String.self, forKey: .stripType)
        self.textColor = try container.decodeIfPresent(String.self, forKey: .textColor)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cardColor, forKey: .cardColor)
        try container.encodeIfPresent(self.headerText, forKey: .headerText)
        try container.encodeIfPresent(self.initialStamps, forKey: .initialStamps)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.stampBackgroundColor, forKey: .stampBackgroundColor)
        try container.encodeIfPresent(self.stampColor, forKey: .stampColor)
        try container.encodeIfPresent(self.stampIcon, forKey: .stampIcon)
        try container.encodeIfPresent(self.stampsRequired, forKey: .stampsRequired)
        try container.encodeIfPresent(self.stripColor, forKey: .stripColor)
        try container.encodeIfPresent(self.stripPreset, forKey: .stripPreset)
        try container.encodeIfPresent(self.stripType, forKey: .stripType)
        try container.encodeIfPresent(self.textColor, forKey: .textColor)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardColor = "card_color"
        case headerText = "header_text"
        case initialStamps = "initial_stamps"
        case name
        case stampBackgroundColor = "stamp_background_color"
        case stampColor = "stamp_color"
        case stampIcon = "stamp_icon"
        case stampsRequired = "stamps_required"
        case stripColor = "strip_color"
        case stripPreset = "strip_preset"
        case stripType = "strip_type"
        case textColor = "text_color"
    }
}