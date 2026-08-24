import Foundation

public struct CheckStatusResponse: Codable, Hashable, Sendable {
    /// Current API version
    public let apiVersion: String
    /// How to authenticate a request
    public let authentication: String
    /// Developer portal: quickstart, auth, webhooks
    public let developerPortalUrl: String
    /// Human readable API reference
    public let documentationUrl: String
    /// OpenAPI description of this API
    public let openapiUrl: String
    public let rateLimit: CheckStatusResponseRateLimit
    /// 'ok' while the API is serving requests
    public let status: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiVersion: String,
        authentication: String,
        developerPortalUrl: String,
        documentationUrl: String,
        openapiUrl: String,
        rateLimit: CheckStatusResponseRateLimit,
        status: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiVersion = apiVersion
        self.authentication = authentication
        self.developerPortalUrl = developerPortalUrl
        self.documentationUrl = documentationUrl
        self.openapiUrl = openapiUrl
        self.rateLimit = rateLimit
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiVersion = try container.decode(String.self, forKey: .apiVersion)
        self.authentication = try container.decode(String.self, forKey: .authentication)
        self.developerPortalUrl = try container.decode(String.self, forKey: .developerPortalUrl)
        self.documentationUrl = try container.decode(String.self, forKey: .documentationUrl)
        self.openapiUrl = try container.decode(String.self, forKey: .openapiUrl)
        self.rateLimit = try container.decode(CheckStatusResponseRateLimit.self, forKey: .rateLimit)
        self.status = try container.decode(String.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiVersion, forKey: .apiVersion)
        try container.encode(self.authentication, forKey: .authentication)
        try container.encode(self.developerPortalUrl, forKey: .developerPortalUrl)
        try container.encode(self.documentationUrl, forKey: .documentationUrl)
        try container.encode(self.openapiUrl, forKey: .openapiUrl)
        try container.encode(self.rateLimit, forKey: .rateLimit)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiVersion = "api_version"
        case authentication
        case developerPortalUrl = "developer_portal_url"
        case documentationUrl = "documentation_url"
        case openapiUrl = "openapi_url"
        case rateLimit = "rate_limit"
        case status
    }
}