import Foundation

public final class StatusClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the status of the API. No authentication required.
    ///
    /// Every response from this API, including this one, carries `RateLimit-Limit`,
    /// `RateLimit-Remaining`, `RateLimit-Reset` and `RateLimit-Policy`. Exceeding
    /// the limit returns 429 with `Retry-After` in seconds.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.status.check()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func check(requestOptions: RequestOptions? = nil) async throws -> CheckStatusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/status",
            requestOptions: requestOptions,
            responseType: CheckStatusResponse.self
        )
    }
}