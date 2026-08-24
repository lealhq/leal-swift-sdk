import Foundation

public struct ListCustomersResponse: Codable, Hashable, Sendable {
    /// The customers on this page
    public let customers: [String]
    public let pagination: ListCustomersResponsePagination
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        customers: [String],
        pagination: ListCustomersResponsePagination,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.customers = customers
        self.pagination = pagination
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customers = try container.decode([String].self, forKey: .customers)
        self.pagination = try container.decode(ListCustomersResponsePagination.self, forKey: .pagination)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.customers, forKey: .customers)
        try container.encode(self.pagination, forKey: .pagination)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case customers
        case pagination
    }
}