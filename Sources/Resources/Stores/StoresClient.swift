import Foundation

public final class StoresClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns every store the authenticated user has access to, including summary counts for locations, cards, customers, and posters.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.stores.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> [ListStoresResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts",
            requestOptions: requestOptions,
            responseType: [ListStoresResponseItem].self
        )
    }

    /// Returns detailed information for a single store, including summary counts for its associated resources.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.stores.get(id: "1")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Store ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> GetStoresResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(id)",
            requestOptions: requestOptions,
            responseType: GetStoresResponse.self
        )
    }

    /// Updates the store's name or store_name. Use `store_name` for the public-facing name displayed to customers.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.stores.update(
    ///         id: "1",
    ///         request: .init(account: UpdateStoresRequestAccount(
    ///
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Store ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateStoresRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateStoresResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/api/v1/accounts/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateStoresResponse.self
        )
    }
}