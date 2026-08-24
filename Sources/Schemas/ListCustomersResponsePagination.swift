import Foundation

public struct ListCustomersResponsePagination: Codable, Hashable, Sendable {
    /// Total customers matching the query
    public let count: Int
    /// Customers per page
    public let items: Int
    /// Current page number
    public let page: Int
    /// Total number of pages
    public let pages: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        count: Int,
        items: Int,
        page: Int,
        pages: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.count = count
        self.items = items
        self.page = page
        self.pages = pages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        self.items = try container.decode(Int.self, forKey: .items)
        self.page = try container.decode(Int.self, forKey: .page)
        self.pages = try container.decode(Int.self, forKey: .pages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.count, forKey: .count)
        try container.encode(self.items, forKey: .items)
        try container.encode(self.page, forKey: .page)
        try container.encode(self.pages, forKey: .pages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case count
        case items
        case page
        case pages
    }
}