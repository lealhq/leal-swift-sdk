import Foundation

public final class CustomersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of customers for the store. Use the `search` parameter to filter
    /// by name, email, phone, card code (barcode), or external reference ID. Alternatively, pass
    /// `source` AND `external_id` together to perform an exact lookup by an external reference -
    /// the response will contain at most one customer.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.customers.list(accountId: "1")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter search: Search query to filter customers by name, email, phone, card code (barcode), or external reference ID
    /// - Parameter source: External system slug (e.g. `square`, `shopify`). When combined with `external_id`, performs an exact lookup.
    /// - Parameter externalId: External system's identifier for the customer. Must be combined with `source`.
    /// - Parameter page: Page number (defaults to 1)
    /// - Parameter items: Number of items per page
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, search: String? = nil, source: String? = nil, externalId: String? = nil, page: Int? = nil, items: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCustomersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/customers",
            queryParams: [
                "search": search.map { .string($0) }, 
                "source": source.map { .string($0) }, 
                "external_id": externalId.map { .string($0) }, 
                "page": page.map { .int($0) }, 
                "items": items.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCustomersResponse.self
        )
    }

    /// Creates a new customer for the store. Requires `first_name` and at least one of `email` or `phone`.
    /// Optionally enroll the customer in a loyalty card by passing `card_id`, and trigger delivery of
    /// card links (email/SMS) by passing `send_card_links`. When a card with initial stamps is assigned,
    /// those stamps are automatically applied as a welcome bonus.
    ///
    /// Pass `metadata` to attach arbitrary key/value data, and `external_references` to link the
    /// customer to records in other systems (e.g. Square, Shopify). External references are upserted
    /// by `(source, external_id)` so this endpoint is safe to call with the same references twice.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.customers.create(
    ///         accountId: "1",
    ///         request: .init(customer: CreateCustomersRequestCustomer(
    ///             firstName: "first_name"
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(accountId: String, request: Requests.CreateCustomersRequest, requestOptions: RequestOptions? = nil) async throws -> CreateCustomersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/customers",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateCustomersResponse.self
        )
    }

    /// Returns detailed information about a single customer, including all of their
    /// enrolled loyalty cards with stamp progress and wallet pass URLs (`apple_wallet_url`
    /// and `google_wallet_url`) for each card. Also includes `metadata` and
    /// `external_references` so you can sync state with external systems.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.customers.get(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Customer ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> GetCustomersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/customers/\(id)",
            requestOptions: requestOptions,
            responseType: GetCustomersResponse.self
        )
    }

    /// Updates an existing customer's details. To add stamps or redeem rewards, use the
    /// customer cards endpoints instead.
    ///
    /// `metadata` is shallow-merged into the existing metadata. `external_references` are upserted
    /// by `(source, external_id)` - to remove a reference, omit it from subsequent calls and use
    /// a separate `DELETE` workflow (not yet exposed via API; manage in dashboard for now).
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.customers.update(
    ///         accountId: "1",
    ///         id: "1",
    ///         request: .init(customer: UpdateCustomersRequestCustomer(
    ///
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Customer ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(accountId: String, id: String, request: Requests.UpdateCustomersRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateCustomersResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/api/v1/accounts/\(accountId)/customers/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateCustomersResponse.self
        )
    }
}