import Foundation

public final class PostersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns all posters for the store. Optionally filter by card or active status.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.posters.list(accountId: "1")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter cardId: Filter posters belonging to a specific card
    /// - Parameter active: When present, return only active posters
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, cardId: Int? = nil, active: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [ListPostersResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/posters",
            queryParams: [
                "card_id": cardId.map { .int($0) }, 
                "active": active.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [ListPostersResponseItem].self
        )
    }

    /// Creates a new printable QR code poster for customer signup. The poster will automatically
    /// generate a unique public signup URL and QR code. The `card_id` is required on create to
    /// associate the poster with a loyalty card.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.posters.create(
    ///         accountId: "1",
    ///         request: .init(poster: CreatePostersRequestPoster(
    ///             cardId: 1
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(accountId: String, request: Requests.CreatePostersRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePostersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/posters",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePostersResponse.self
        )
    }

    /// Returns a single poster by ID, including generated signup and display URLs.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.posters.get(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Poster ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> GetPostersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/posters/\(id)",
            requestOptions: requestOptions,
            responseType: GetPostersResponse.self
        )
    }

    /// Permanently deletes a poster. The public signup URL will stop working.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.posters.delete(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Poster ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/api/v1/accounts/\(accountId)/posters/\(id)",
            requestOptions: requestOptions
        )
    }

    /// Updates an existing poster. The `card_id` cannot be changed after creation.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.posters.update(
    ///         accountId: "1",
    ///         id: "1",
    ///         request: .init(poster: UpdatePostersRequestPoster(
    ///
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Poster ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(accountId: String, id: String, request: Requests.UpdatePostersRequest, requestOptions: RequestOptions? = nil) async throws -> UpdatePostersResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/api/v1/accounts/\(accountId)/posters/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdatePostersResponse.self
        )
    }
}