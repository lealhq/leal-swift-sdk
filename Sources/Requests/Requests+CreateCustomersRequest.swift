import Foundation

extension Requests {
    public struct CreateCustomersRequest: Codable, Hashable, Sendable {
        /// Loyalty card ID to auto-enroll the customer in
        public let cardId: Int?
        public let customer: CreateCustomersRequestCustomer
        /// Records the new customer as invited by another customer: the code is the last part of that customer's `referral_url`. Needs `card_id`, for the same card, with referrals on. Nothing is given now; both customers get their stamps when the new customer's card is first stamped for a visit
        public let referralCode: String?
        /// When true, sends the card links to the customer via email/SMS after enrollment. Note: even without this flag, the response includes `apple_wallet_url` and `google_wallet_url` in each customer card object so you can deliver them yourself.
        public let sendCardLinks: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cardId: Int? = nil,
            customer: CreateCustomersRequestCustomer,
            referralCode: String? = nil,
            sendCardLinks: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cardId = cardId
            self.customer = customer
            self.referralCode = referralCode
            self.sendCardLinks = sendCardLinks
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cardId = try container.decodeIfPresent(Int.self, forKey: .cardId)
            self.customer = try container.decode(CreateCustomersRequestCustomer.self, forKey: .customer)
            self.referralCode = try container.decodeIfPresent(String.self, forKey: .referralCode)
            self.sendCardLinks = try container.decodeIfPresent(Bool.self, forKey: .sendCardLinks)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.cardId, forKey: .cardId)
            try container.encode(self.customer, forKey: .customer)
            try container.encodeIfPresent(self.referralCode, forKey: .referralCode)
            try container.encodeIfPresent(self.sendCardLinks, forKey: .sendCardLinks)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case cardId = "card_id"
            case customer
            case referralCode = "referral_code"
            case sendCardLinks = "send_card_links"
        }
    }
}