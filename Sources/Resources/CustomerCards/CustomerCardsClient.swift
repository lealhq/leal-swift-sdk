import Foundation

public final class CustomerCardsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns all loyalty cards enrolled for a specific customer, including stamp progress,
    /// status, wallet pass installation state, and wallet pass URLs (`apple_wallet_url` and
    /// `google_wallet_url`) that you can use to let customers add their loyalty card to
    /// Apple Wallet or Google Wallet from your own app or website.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.customerCards.list(
    ///         accountId: "1",
    ///         customerId: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter customerId: Customer ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, customerId: String, requestOptions: RequestOptions? = nil) async throws -> [ListCustomerCardsResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/customers/\(customerId)/customer_cards",
            requestOptions: requestOptions,
            responseType: [ListCustomerCardsResponseItem].self
        )
    }

    /// Returns detailed information about a specific customer card, including stamp progress,
    /// a list of rewards the customer has earned enough stamps to redeem, and wallet pass URLs
    /// (`apple_wallet_url` and `google_wallet_url`) for adding the card to Apple Wallet or
    /// Google Wallet.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.customerCards.get(
    ///         accountId: "1",
    ///         customerId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter customerId: Customer ID
    /// - Parameter id: Customer card ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(accountId: String, customerId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> GetCustomerCardsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/customers/\(customerId)/customer_cards/\(id)",
            requestOptions: requestOptions,
            responseType: GetCustomerCardsResponse.self
        )
    }

    /// Redeems a reward for a customer, deducting the required stamps from their card.
    /// The customer must have enough stamps on this card to cover the reward's cost.
    /// Triggers wallet pass updates and push notifications.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.customerCards.redeem(
    ///         accountId: "1",
    ///         customerId: "1",
    ///         id: "1",
    ///         request: .init(rewardId: 1)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter customerId: Customer ID
    /// - Parameter id: Customer card ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func redeem(accountId: String, customerId: String, id: String, request: Requests.RedeemCustomerCardsRequest, requestOptions: RequestOptions? = nil) async throws -> RedeemCustomerCardsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/customers/\(customerId)/customer_cards/\(id)/redeem",
            body: request,
            requestOptions: requestOptions,
            responseType: RedeemCustomerCardsResponse.self
        )
    }

    /// Adds stamps to a customer's loyalty card. Triggers ledger entries, wallet pass updates,
    /// and push notifications. Pass `skip_notifications` to stamp silently.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.customerCards.stamp(
    ///         accountId: "1",
    ///         customerId: "1",
    ///         id: "1",
    ///         request: .init(stamps: 1)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter customerId: Customer ID
    /// - Parameter id: Customer card ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func stamp(accountId: String, customerId: String, id: String, request: Requests.StampCustomerCardsRequest, requestOptions: RequestOptions? = nil) async throws -> StampCustomerCardsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/customers/\(customerId)/customer_cards/\(id)/stamp",
            body: request,
            requestOptions: requestOptions,
            responseType: StampCustomerCardsResponse.self
        )
    }
}