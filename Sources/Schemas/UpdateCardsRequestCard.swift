import Foundation

public struct UpdateCardsRequestCard: Codable, Hashable, Sendable {
    /// Up to two extra front-of-pass fields. Blank values are ignored.
    public let auxiliaryFields: [String]?
    /// Hex colour for the card background
    public let cardColor: String?
    /// Card expiry timestamp (ISO 8601)
    public let expiresAt: String?
    /// Optional header text displayed on the card
    public let headerText: String?
    /// Pre-filled stamps (must be >= 0 and < stamps_required)
    public let initialStamps: Int?
    /// Card name
    public let name: String?
    /// Whether wallet passes show the member name field
    public let showMemberField: Bool?
    /// Whether wallet passes show the stamps-to-reward field
    public let showStampsToRewardField: Bool?
    /// Hex colour for stamp backgrounds
    public let stampBackgroundColor: String?
    /// Hex colour for stamp icons
    public let stampColor: String?
    /// Stamp icon identifier
    public let stampIcon: String?
    /// Number of stamps needed (1–21)
    public let stampsRequired: Int?
    /// Hex colour for the strip
    public let stripColor: String?
    /// Preset strip image identifier
    public let stripPreset: String?
    /// Strip image type
    public let stripType: String?
    /// Hex colour for card text
    public let textColor: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        auxiliaryFields: [String]? = nil,
        cardColor: String? = nil,
        expiresAt: String? = nil,
        headerText: String? = nil,
        initialStamps: Int? = nil,
        name: String? = nil,
        showMemberField: Bool? = nil,
        showStampsToRewardField: Bool? = nil,
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
        self.auxiliaryFields = auxiliaryFields
        self.cardColor = cardColor
        self.expiresAt = expiresAt
        self.headerText = headerText
        self.initialStamps = initialStamps
        self.name = name
        self.showMemberField = showMemberField
        self.showStampsToRewardField = showStampsToRewardField
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
        self.auxiliaryFields = try container.decodeIfPresent([String].self, forKey: .auxiliaryFields)
        self.cardColor = try container.decodeIfPresent(String.self, forKey: .cardColor)
        self.expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        self.headerText = try container.decodeIfPresent(String.self, forKey: .headerText)
        self.initialStamps = try container.decodeIfPresent(Int.self, forKey: .initialStamps)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.showMemberField = try container.decodeIfPresent(Bool.self, forKey: .showMemberField)
        self.showStampsToRewardField = try container.decodeIfPresent(Bool.self, forKey: .showStampsToRewardField)
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
        try container.encodeIfPresent(self.auxiliaryFields, forKey: .auxiliaryFields)
        try container.encodeIfPresent(self.cardColor, forKey: .cardColor)
        try container.encodeIfPresent(self.expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(self.headerText, forKey: .headerText)
        try container.encodeIfPresent(self.initialStamps, forKey: .initialStamps)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.showMemberField, forKey: .showMemberField)
        try container.encodeIfPresent(self.showStampsToRewardField, forKey: .showStampsToRewardField)
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
        case auxiliaryFields = "auxiliary_fields"
        case cardColor = "card_color"
        case expiresAt = "expires_at"
        case headerText = "header_text"
        case initialStamps = "initial_stamps"
        case name
        case showMemberField = "show_member_field"
        case showStampsToRewardField = "show_stamps_to_reward_field"
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