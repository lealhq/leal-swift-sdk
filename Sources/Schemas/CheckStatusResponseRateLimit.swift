import Foundation

public struct CheckStatusResponseRateLimit: Codable, Hashable, Sendable {
    /// Requests allowed per window
    public let limit: Int
    /// What the limit is counted against
    public let scope: String
    /// Length of the window in seconds
    public let windowSeconds: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        limit: Int,
        scope: String,
        windowSeconds: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.limit = limit
        self.scope = scope
        self.windowSeconds = windowSeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.limit = try container.decode(Int.self, forKey: .limit)
        self.scope = try container.decode(String.self, forKey: .scope)
        self.windowSeconds = try container.decode(Int.self, forKey: .windowSeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.limit, forKey: .limit)
        try container.encode(self.scope, forKey: .scope)
        try container.encode(self.windowSeconds, forKey: .windowSeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case limit
        case scope
        case windowSeconds = "window_seconds"
    }
}