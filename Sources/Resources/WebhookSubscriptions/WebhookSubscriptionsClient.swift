import Foundation

public final class WebhookSubscriptionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns every webhook subscription for the store, oldest first. Signing secrets are not included; fetch a single subscription to read its secret.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.webhookSubscriptions.getApiV1AccountsAccountIdWebhookSubscriptions(accountId: "1")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter event: Only return subscriptions that list this event (or `*`)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getApiV1AccountsAccountIdWebhookSubscriptions(accountId: String, event: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [GetApiV1AccountsAccountIdWebhookSubscriptionsResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/webhook_subscriptions",
            queryParams: [
                "event": event.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [GetApiV1AccountsAccountIdWebhookSubscriptionsResponseItem].self
        )
    }

    /// Subscribes a URL to one or more events. The response includes the signing `secret`; store it to
    /// verify deliveries. The URL must be publicly reachable over https.
    ///
    /// Events: `customer.created`, `customer.updated`, `customer_card.created`, `stamp.earned`, `stamp.removed`, `reward.unlocked`, `reward.redeemed`, `referral.created`, `referral.rewarded`, or `*` for all of them.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.webhookSubscriptions.postApiV1AccountsAccountIdWebhookSubscriptions(
    ///         accountId: "1",
    ///         request: .init(targetUrl: "target_url")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func postApiV1AccountsAccountIdWebhookSubscriptions(accountId: String, request: Requests.PostApiV1AccountsAccountIdWebhookSubscriptionsRequest, requestOptions: RequestOptions? = nil) async throws -> PostApiV1AccountsAccountIdWebhookSubscriptionsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/webhook_subscriptions",
            body: request,
            requestOptions: requestOptions,
            responseType: PostApiV1AccountsAccountIdWebhookSubscriptionsResponse.self
        )
    }

    /// Returns a single subscription, including its signing secret and the result of the most recent delivery.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.webhookSubscriptions.getApiV1AccountsAccountIdWebhookSubscriptionsId(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Webhook subscription ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getApiV1AccountsAccountIdWebhookSubscriptionsId(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> GetApiV1AccountsAccountIdWebhookSubscriptionsIdResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api/v1/accounts/\(accountId)/webhook_subscriptions/\(id)",
            requestOptions: requestOptions,
            responseType: GetApiV1AccountsAccountIdWebhookSubscriptionsIdResponse.self
        )
    }

    /// Stops deliveries and deletes the subscription. This cannot be undone.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.webhookSubscriptions.deleteApiV1AccountsAccountIdWebhookSubscriptionsId(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Webhook subscription ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deleteApiV1AccountsAccountIdWebhookSubscriptionsId(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/api/v1/accounts/\(accountId)/webhook_subscriptions/\(id)",
            requestOptions: requestOptions
        )
    }

    /// Changes the URL, events, label or payload format, or turns the subscription off and on. Re-enabling a subscription that was disabled for failing clears its failure state.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.webhookSubscriptions.patchApiV1AccountsAccountIdWebhookSubscriptionsId(
    ///         accountId: "1",
    ///         id: "1",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Webhook subscription ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func patchApiV1AccountsAccountIdWebhookSubscriptionsId(accountId: String, id: String, request: Requests.PatchApiV1AccountsAccountIdWebhookSubscriptionsIdRequest, requestOptions: RequestOptions? = nil) async throws -> PatchApiV1AccountsAccountIdWebhookSubscriptionsIdResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/api/v1/accounts/\(accountId)/webhook_subscriptions/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: PatchApiV1AccountsAccountIdWebhookSubscriptionsIdResponse.self
        )
    }

    /// Replaces the subscription's signing secret. Deliveries are signed with the new secret straight away, so update your receiver at the same time.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.webhookSubscriptions.postApiV1AccountsAccountIdWebhookSubscriptionsIdRotateSecret(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Webhook subscription ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func postApiV1AccountsAccountIdWebhookSubscriptionsIdRotateSecret(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> PostApiV1AccountsAccountIdWebhookSubscriptionsIdRotateSecretResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/webhook_subscriptions/\(id)/rotate_secret",
            requestOptions: requestOptions,
            responseType: PostApiV1AccountsAccountIdWebhookSubscriptionsIdRotateSecretResponse.self
        )
    }

    /// Immediately sends a signed `webhook.test` event to the subscription's URL and reports what
    /// happened, so you can check your endpoint and signature verification without waiting for real
    /// activity. Test events are not retried and do not count towards disabling the subscription.
    ///
    /// ```swift
    /// import Foundation
    /// import Leal
    ///
    /// private func main() async throws {
    ///     let client = LealClient(token: "<token>")
    ///
    ///     _ = try await client.webhookSubscriptions.postApiV1AccountsAccountIdWebhookSubscriptionsIdTest(
    ///         accountId: "1",
    ///         id: "1"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Store (account) ID
    /// - Parameter id: Webhook subscription ID
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func postApiV1AccountsAccountIdWebhookSubscriptionsIdTest(accountId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> PostApiV1AccountsAccountIdWebhookSubscriptionsIdTestResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api/v1/accounts/\(accountId)/webhook_subscriptions/\(id)/test",
            requestOptions: requestOptions,
            responseType: PostApiV1AccountsAccountIdWebhookSubscriptionsIdTestResponse.self
        )
    }
}