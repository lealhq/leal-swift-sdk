import Foundation

extension Requests {
    public struct UpdateCustomersRequest: Codable, Hashable, Sendable {
        public let customer: UpdateCustomersRequestCustomer
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            customer: UpdateCustomersRequestCustomer,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.customer = customer
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.customer = try container.decode(UpdateCustomersRequestCustomer.self, forKey: .customer)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.customer, forKey: .customer)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case customer
        }
    }
}