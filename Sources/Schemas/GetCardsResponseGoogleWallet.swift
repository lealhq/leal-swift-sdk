import Foundation

public struct GetCardsResponseGoogleWallet: Codable, Hashable, Sendable {
    /// What fills the hero image behind the stamps: 'hero_image' (uploaded in Leal), 'strip_image', 'preset' or 'color'
    public let heroImage: String
    /// The text colour Google Wallet uses on this card: it picks black or white itself and ignores text_color
    public let textColor: String
    /// Guidelines the card doesn't meet: any of 'color', 'title', 'issuer_name', 'field_labels', 'field_values', 'logo', 'hero'. Empty when it meets them all
    public let warnings: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        heroImage: String,
        textColor: String,
        warnings: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.heroImage = heroImage
        self.textColor = textColor
        self.warnings = warnings
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.heroImage = try container.decode(String.self, forKey: .heroImage)
        self.textColor = try container.decode(String.self, forKey: .textColor)
        self.warnings = try container.decode([String].self, forKey: .warnings)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.heroImage, forKey: .heroImage)
        try container.encode(self.textColor, forKey: .textColor)
        try container.encode(self.warnings, forKey: .warnings)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case heroImage = "hero_image"
        case textColor = "text_color"
        case warnings
    }
}