import Foundation

public struct CheckStatusResponseVersioning: Codable, Hashable, Sendable {
    /// The version to build against
    public let current: String
    /// Versions that are deprecated but still serving
    public let deprecated: [String]
    /// The published versioning and deprecation policy
    public let policyUrl: String
    /// The headers a deprecated version sends
    public let signalling: String
    /// Every version still serving requests
    public let supported: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        current: String,
        deprecated: [String],
        policyUrl: String,
        signalling: String,
        supported: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.current = current
        self.deprecated = deprecated
        self.policyUrl = policyUrl
        self.signalling = signalling
        self.supported = supported
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.current = try container.decode(String.self, forKey: .current)
        self.deprecated = try container.decode([String].self, forKey: .deprecated)
        self.policyUrl = try container.decode(String.self, forKey: .policyUrl)
        self.signalling = try container.decode(String.self, forKey: .signalling)
        self.supported = try container.decode([String].self, forKey: .supported)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.current, forKey: .current)
        try container.encode(self.deprecated, forKey: .deprecated)
        try container.encode(self.policyUrl, forKey: .policyUrl)
        try container.encode(self.signalling, forKey: .signalling)
        try container.encode(self.supported, forKey: .supported)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case current
        case deprecated
        case policyUrl = "policy_url"
        case signalling
        case supported
    }
}