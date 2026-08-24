import Foundation

public struct GetLocationsResponse: Codable, Hashable, Sendable {
    /// Parent store ID
    public let accountId: Int
    /// Full street address
    public let address: String
    /// ISO 8601 creation timestamp
    public let createdAt: String
    /// Unique location ID
    public let id: Int
    /// Geocoded latitude (auto-derived from address)
    public let latitude: Double
    /// Geocoded longitude (auto-derived from address)
    public let longitude: Double
    /// Location name (e.g. 'Downtown Branch')
    public let name: String
    /// ISO 8601 last-update timestamp
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Int,
        address: String,
        createdAt: String,
        id: Int,
        latitude: Double,
        longitude: Double,
        name: String,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.address = address
        self.createdAt = createdAt
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Int.self, forKey: .accountId)
        self.address = try container.decode(String.self, forKey: .address)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(Int.self, forKey: .id)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.name = try container.decode(String.self, forKey: .name)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case address
        case createdAt = "created_at"
        case id
        case latitude
        case longitude
        case name
        case updatedAt = "updated_at"
    }
}