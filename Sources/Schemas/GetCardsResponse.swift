import Foundation

public struct GetCardsResponse: Codable, Hashable, Sendable {
    /// ISO 8601 timestamp when the card was archived, or null if active
    public let archivedAt: String
    /// Hex colour for the card background (e.g. '#6B4226')
    public let cardColor: String
    /// ISO 8601 creation timestamp
    public let createdAt: String
    /// Number of customer card instances issued
    public let customerCardsCount: Int
    /// Optional header text displayed on the card
    public let headerText: String
    /// Unique card ID
    public let id: Int
    /// Number of stamps pre-filled on new customer cards (0 to stamps_required - 1)
    public let initialStamps: Int
    /// Card name (e.g. 'Coffee Loyalty Card')
    public let name: String
    /// Number of rewards defined for this card
    public let rewardsCount: Int
    /// Hex colour for stamp backgrounds
    public let stampBackgroundColor: String
    /// Hex colour for stamp icons
    public let stampColor: String
    /// Icon used for stamps (e.g. 'coffee', 'heart', 'star')
    public let stampIcon: String
    /// Number of stamps needed to complete the card (1–21)
    public let stampsRequired: Int
    /// Hex colour for the strip (when strip_type is 'color')
    public let stripColor: String
    /// Preset strip image identifier (when strip_type is 'preset')
    public let stripPreset: String
    /// Strip image type: 'color', 'image', or 'preset'
    public let stripType: String
    /// Hex colour for card text
    public let textColor: String
    /// ISO 8601 last-update timestamp
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        archivedAt: String,
        cardColor: String,
        createdAt: String,
        customerCardsCount: Int,
        headerText: String,
        id: Int,
        initialStamps: Int,
        name: String,
        rewardsCount: Int,
        stampBackgroundColor: String,
        stampColor: String,
        stampIcon: String,
        stampsRequired: Int,
        stripColor: String,
        stripPreset: String,
        stripType: String,
        textColor: String,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.archivedAt = archivedAt
        self.cardColor = cardColor
        self.createdAt = createdAt
        self.customerCardsCount = customerCardsCount
        self.headerText = headerText
        self.id = id
        self.initialStamps = initialStamps
        self.name = name
        self.rewardsCount = rewardsCount
        self.stampBackgroundColor = stampBackgroundColor
        self.stampColor = stampColor
        self.stampIcon = stampIcon
        self.stampsRequired = stampsRequired
        self.stripColor = stripColor
        self.stripPreset = stripPreset
        self.stripType = stripType
        self.textColor = textColor
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.archivedAt = try container.decode(String.self, forKey: .archivedAt)
        self.cardColor = try container.decode(String.self, forKey: .cardColor)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customerCardsCount = try container.decode(Int.self, forKey: .customerCardsCount)
        self.headerText = try container.decode(String.self, forKey: .headerText)
        self.id = try container.decode(Int.self, forKey: .id)
        self.initialStamps = try container.decode(Int.self, forKey: .initialStamps)
        self.name = try container.decode(String.self, forKey: .name)
        self.rewardsCount = try container.decode(Int.self, forKey: .rewardsCount)
        self.stampBackgroundColor = try container.decode(String.self, forKey: .stampBackgroundColor)
        self.stampColor = try container.decode(String.self, forKey: .stampColor)
        self.stampIcon = try container.decode(String.self, forKey: .stampIcon)
        self.stampsRequired = try container.decode(Int.self, forKey: .stampsRequired)
        self.stripColor = try container.decode(String.self, forKey: .stripColor)
        self.stripPreset = try container.decode(String.self, forKey: .stripPreset)
        self.stripType = try container.decode(String.self, forKey: .stripType)
        self.textColor = try container.decode(String.self, forKey: .textColor)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.archivedAt, forKey: .archivedAt)
        try container.encode(self.cardColor, forKey: .cardColor)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customerCardsCount, forKey: .customerCardsCount)
        try container.encode(self.headerText, forKey: .headerText)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.initialStamps, forKey: .initialStamps)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.rewardsCount, forKey: .rewardsCount)
        try container.encode(self.stampBackgroundColor, forKey: .stampBackgroundColor)
        try container.encode(self.stampColor, forKey: .stampColor)
        try container.encode(self.stampIcon, forKey: .stampIcon)
        try container.encode(self.stampsRequired, forKey: .stampsRequired)
        try container.encode(self.stripColor, forKey: .stripColor)
        try container.encode(self.stripPreset, forKey: .stripPreset)
        try container.encode(self.stripType, forKey: .stripType)
        try container.encode(self.textColor, forKey: .textColor)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case archivedAt = "archived_at"
        case cardColor = "card_color"
        case createdAt = "created_at"
        case customerCardsCount = "customer_cards_count"
        case headerText = "header_text"
        case id
        case initialStamps = "initial_stamps"
        case name
        case rewardsCount = "rewards_count"
        case stampBackgroundColor = "stamp_background_color"
        case stampColor = "stamp_color"
        case stampIcon = "stamp_icon"
        case stampsRequired = "stamps_required"
        case stripColor = "strip_color"
        case stripPreset = "strip_preset"
        case stripType = "strip_type"
        case textColor = "text_color"
        case updatedAt = "updated_at"
    }
}