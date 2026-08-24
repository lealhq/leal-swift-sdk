import Foundation

public struct UpdateStoresResponse: Codable, Hashable, Sendable {
    /// Number of loyalty card templates
    public let cardsCount: Int
    /// ISO 8601 creation timestamp
    public let createdAt: String
    /// Number of enrolled customers
    public let customersCount: Int
    /// Resolved display name (store_name if present, otherwise name)
    public let displayStoreName: String
    /// Unique store ID
    public let id: Int
    /// Number of physical locations
    public let locationsCount: Int
    /// Internal account name
    public let name: String
    /// Whether this is the user's personal account
    public let personal: Bool
    /// Number of QR signup posters
    public let postersCount: Int
    /// Public-facing store name
    public let storeName: String
    /// ISO 8601 last-update timestamp
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardsCount: Int,
        createdAt: String,
        customersCount: Int,
        displayStoreName: String,
        id: Int,
        locationsCount: Int,
        name: String,
        personal: Bool,
        postersCount: Int,
        storeName: String,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardsCount = cardsCount
        self.createdAt = createdAt
        self.customersCount = customersCount
        self.displayStoreName = displayStoreName
        self.id = id
        self.locationsCount = locationsCount
        self.name = name
        self.personal = personal
        self.postersCount = postersCount
        self.storeName = storeName
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardsCount = try container.decode(Int.self, forKey: .cardsCount)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customersCount = try container.decode(Int.self, forKey: .customersCount)
        self.displayStoreName = try container.decode(String.self, forKey: .displayStoreName)
        self.id = try container.decode(Int.self, forKey: .id)
        self.locationsCount = try container.decode(Int.self, forKey: .locationsCount)
        self.name = try container.decode(String.self, forKey: .name)
        self.personal = try container.decode(Bool.self, forKey: .personal)
        self.postersCount = try container.decode(Int.self, forKey: .postersCount)
        self.storeName = try container.decode(String.self, forKey: .storeName)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cardsCount, forKey: .cardsCount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customersCount, forKey: .customersCount)
        try container.encode(self.displayStoreName, forKey: .displayStoreName)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.locationsCount, forKey: .locationsCount)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.personal, forKey: .personal)
        try container.encode(self.postersCount, forKey: .postersCount)
        try container.encode(self.storeName, forKey: .storeName)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardsCount = "cards_count"
        case createdAt = "created_at"
        case customersCount = "customers_count"
        case displayStoreName = "display_store_name"
        case id
        case locationsCount = "locations_count"
        case name
        case personal
        case postersCount = "posters_count"
        case storeName = "store_name"
        case updatedAt = "updated_at"
    }
}