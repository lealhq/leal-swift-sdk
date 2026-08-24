import Foundation

public final class CardsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns loyalty card templates for the specified store. By default, only
    /// active (unarchived) cards are returned. Use the `scope` parameter to include
    /// archived cards.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.cards.list(accountId: "1")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Parent store ID
    /// - Parameter scope: Filter cards by archive status. Default: active only.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, scope: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [ListCardsResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/cards",
            queryParams: [
                "scope": scope.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [ListCardsResponseItem].self
        )
    }

    /// Creates a new loyalty stamp card template for the store. The card defines the
    /// visual design (colours, icon, strip) and program rules (stamps required,
    /// initial stamps).
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.cards.create(
    ///         accountId: "1",
    ///         request: .init(card: CreateCardsRequestCard(
    ///             name: "name"
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Parent store ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(accountId: String, request: Requests.CreateCardsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateCardsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/cards",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateCardsResponse.self
        )
    }

    /// Returns a single loyalty card template by ID, including reward and customer card counts.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.cards.get(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Parent store ID
    /// - Parameter id: Card ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> GetCardsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/cards/\(id)",
            requestOptions: requestOptions,
            responseType: GetCardsResponse.self
        )
    }

    /// Updates an existing loyalty card template. Only the provided attributes are changed.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.cards.update(
    ///         accountId: "1",
    ///         id: "1",
    ///         request: .init(card: UpdateCardsRequestCard(
    ///
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Parent store ID
    /// - Parameter id: Card ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(accountId: String, id: String, request: Requests.UpdateCardsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateCardsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/api/v1/accounts/\(accountId)/cards/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateCardsResponse.self
        )
    }
}