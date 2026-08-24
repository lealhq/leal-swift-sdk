import Foundation

/// A JSON error payload. Agents should read `error` for a human readable summary and `errors` for per field validation messages when present.
public struct Error: Codable, Hashable, Sendable {
    /// Human readable description of what went wrong.
    public let error: String?
    /// Validation messages, either a list of strings or an object keyed by field name.
    public let errors: ErrorErrors?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: String? = nil,
        errors: ErrorErrors? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.errors = errors
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.errors = try container.decodeIfPresent(ErrorErrors.self, forKey: .errors)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encodeIfPresent(self.errors, forKey: .errors)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case errors
    }
}