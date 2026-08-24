import Foundation

public final class LocationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns every physical location belonging to the specified store.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.locations.list(accountId: "1")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Parent store ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, requestOptions: RequestOptions? = nil) async throws -> [ListLocationsResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/locations",
            requestOptions: requestOptions,
            responseType: [ListLocationsResponseItem].self
        )
    }

    /// Creates a new physical location for the store. The provided address is
    /// automatically geocoded to latitude and longitude coordinates in the background.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.locations.create(
    ///         accountId: "1",
    ///         request: .init(location: CreateLocationsRequestLocation(
    ///             address: "address",
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
    public func create(accountId: String, request: Requests.CreateLocationsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateLocationsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/locations",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateLocationsResponse.self
        )
    }

    /// Returns a single location by ID.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.locations.get(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Parent store ID
    /// - Parameter id: Location ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> GetLocationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/locations/\(id)",
            requestOptions: requestOptions,
            responseType: GetLocationsResponse.self
        )
    }

    /// Permanently deletes a location. This action cannot be undone.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.locations.delete(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Parent store ID
    /// - Parameter id: Location ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/api/v1/accounts/\(accountId)/locations/\(id)",
            requestOptions: requestOptions
        )
    }

    /// Updates an existing location. If the address is changed, it will be re-geocoded automatically.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.locations.update(
    ///         accountId: "1",
    ///         id: "1",
    ///         request: .init(location: UpdateLocationsRequestLocation(
    ///
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Parent store ID
    /// - Parameter id: Location ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(accountId: String, id: String, request: Requests.UpdateLocationsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateLocationsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/api/v1/accounts/\(accountId)/locations/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateLocationsResponse.self
        )
    }
}