import Foundation

public final class RewardsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns all rewards for the store. Optionally filter by card or active status.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.rewards.list(accountId: "1")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter cardId: Filter rewards belonging to a specific card
    /// - Parameter active: When present, return only active rewards
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, cardId: Int? = nil, active: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [ListRewardsResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/rewards",
            queryParams: [
                "card_id": cardId.map { .int($0) }, 
                "active": active.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [ListRewardsResponseItem].self
        )
    }

    /// Creates a new reward for a loyalty card. The card must belong to the same store.
    /// The `card_id` is required on create but cannot be changed afterwards.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.rewards.create(
    ///         accountId: "1",
    ///         request: .init(reward: CreateRewardsRequestReward(
    ///             cardId: 1,
    ///             name: "name",
    ///             stampsRequired: 1
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(accountId: String, request: Requests.CreateRewardsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateRewardsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/rewards",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateRewardsResponse.self
        )
    }

    /// Returns a single reward by ID.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.rewards.get(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Reward ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> GetRewardsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/rewards/\(id)",
            requestOptions: requestOptions,
            responseType: GetRewardsResponse.self
        )
    }

    /// Permanently deletes a reward. This cannot be undone.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.rewards.delete(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Reward ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/api/v1/accounts/\(accountId)/rewards/\(id)",
            requestOptions: requestOptions
        )
    }

    /// Updates an existing reward. The `card_id` cannot be changed after creation.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.rewards.update(
    ///         accountId: "1",
    ///         id: "1",
    ///         request: .init(reward: UpdateRewardsRequestReward(
    ///
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Reward ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(accountId: String, id: String, request: Requests.UpdateRewardsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateRewardsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/api/v1/accounts/\(accountId)/rewards/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateRewardsResponse.self
        )
    }
}