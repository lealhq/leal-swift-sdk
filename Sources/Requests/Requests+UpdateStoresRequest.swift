import Foundation

extension Requests {
    public struct UpdateStoresRequest: Codable, Hashable, Sendable {
        public let account: UpdateStoresRequestAccount
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            account: UpdateStoresRequestAccount,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.account = account
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.account = try container.decode(UpdateStoresRequestAccount.self, forKey: .account)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.account, forKey: .account)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case account
        }
    }
}