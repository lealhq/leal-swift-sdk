import Foundation
import Testing
import Leal

@Suite("WebhookSubscriptionsClient Wire Tests") struct WebhookSubscriptionsClientWireTests {
    @Test func getApiV1AccountsAccountIdWebhookSubscriptions1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                [
                  {
                    "account_id": 1,
                    "created_at": "created_at",
                    "description": "description",
                    "disabled_at": "disabled_at",
                    "disabled_reason": "disabled_reason",
                    "enabled": true,
                    "event": "event",
                    "events": [
                      "events"
                    ],
                    "id": 1,
                    "last_delivery_at": "last_delivery_at",
                    "last_delivery_error": "last_delivery_error",
                    "last_delivery_status": 1.1,
                    "payload_format": "payload_format",
                    "target_url": "target_url",
                    "updated_at": "updated_at"
                  }
                ]
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            GetApiV1AccountsAccountIdWebhookSubscriptionsResponseItem(
                accountId: 1,
                createdAt: "created_at",
                description: "description",
                disabledAt: "disabled_at",
                disabledReason: "disabled_reason",
                enabled: true,
                event: "event",
                events: [
                    "events"
                ],
                id: 1,
                lastDeliveryAt: "last_delivery_at",
                lastDeliveryError: "last_delivery_error",
                lastDeliveryStatus: 1.1,
                payloadFormat: "payload_format",
                targetUrl: "target_url",
                updatedAt: "updated_at"
            )
        ]
        let response = try await client.webhookSubscriptions.getApiV1AccountsAccountIdWebhookSubscriptions(
            accountId: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func postApiV1AccountsAccountIdWebhookSubscriptions1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": 1,
                  "created_at": "created_at",
                  "description": "description",
                  "disabled_at": "disabled_at",
                  "disabled_reason": "disabled_reason",
                  "enabled": true,
                  "event": "event",
                  "events": [
                    "events"
                  ],
                  "id": 1,
                  "last_delivery_at": "last_delivery_at",
                  "last_delivery_error": "last_delivery_error",
                  "last_delivery_status": 1.1,
                  "payload_format": "payload_format",
                  "secret": "secret",
                  "target_url": "target_url",
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PostApiV1AccountsAccountIdWebhookSubscriptionsResponse(
            accountId: 1,
            createdAt: "created_at",
            description: "description",
            disabledAt: "disabled_at",
            disabledReason: "disabled_reason",
            enabled: true,
            event: "event",
            events: [
                "events"
            ],
            id: 1,
            lastDeliveryAt: "last_delivery_at",
            lastDeliveryError: "last_delivery_error",
            lastDeliveryStatus: 1.1,
            payloadFormat: "payload_format",
            secret: "secret",
            targetUrl: "target_url",
            updatedAt: "updated_at"
        )
        let response = try await client.webhookSubscriptions.postApiV1AccountsAccountIdWebhookSubscriptions(
            accountId: "1",
            request: .init(targetUrl: "target_url"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getApiV1AccountsAccountIdWebhookSubscriptionsId1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": 1,
                  "created_at": "created_at",
                  "description": "description",
                  "disabled_at": "disabled_at",
                  "disabled_reason": "disabled_reason",
                  "enabled": true,
                  "event": "event",
                  "events": [
                    "events"
                  ],
                  "id": 1,
                  "last_delivery_at": "last_delivery_at",
                  "last_delivery_error": "last_delivery_error",
                  "last_delivery_status": 1.1,
                  "payload_format": "payload_format",
                  "secret": "secret",
                  "target_url": "target_url",
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetApiV1AccountsAccountIdWebhookSubscriptionsIdResponse(
            accountId: 1,
            createdAt: "created_at",
            description: "description",
            disabledAt: "disabled_at",
            disabledReason: "disabled_reason",
            enabled: true,
            event: "event",
            events: [
                "events"
            ],
            id: 1,
            lastDeliveryAt: "last_delivery_at",
            lastDeliveryError: "last_delivery_error",
            lastDeliveryStatus: 1.1,
            payloadFormat: "payload_format",
            secret: "secret",
            targetUrl: "target_url",
            updatedAt: "updated_at"
        )
        let response = try await client.webhookSubscriptions.getApiV1AccountsAccountIdWebhookSubscriptionsId(
            accountId: "1",
            id: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func patchApiV1AccountsAccountIdWebhookSubscriptionsId1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": 1,
                  "created_at": "created_at",
                  "description": "description",
                  "disabled_at": "disabled_at",
                  "disabled_reason": "disabled_reason",
                  "enabled": true,
                  "event": "event",
                  "events": [
                    "events"
                  ],
                  "id": 1,
                  "last_delivery_at": "last_delivery_at",
                  "last_delivery_error": "last_delivery_error",
                  "last_delivery_status": 1.1,
                  "payload_format": "payload_format",
                  "target_url": "target_url",
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PatchApiV1AccountsAccountIdWebhookSubscriptionsIdResponse(
            accountId: 1,
            createdAt: "created_at",
            description: "description",
            disabledAt: "disabled_at",
            disabledReason: "disabled_reason",
            enabled: true,
            event: "event",
            events: [
                "events"
            ],
            id: 1,
            lastDeliveryAt: "last_delivery_at",
            lastDeliveryError: "last_delivery_error",
            lastDeliveryStatus: 1.1,
            payloadFormat: "payload_format",
            targetUrl: "target_url",
            updatedAt: "updated_at"
        )
        let response = try await client.webhookSubscriptions.patchApiV1AccountsAccountIdWebhookSubscriptionsId(
            accountId: "1",
            id: "1",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func postApiV1AccountsAccountIdWebhookSubscriptionsIdRotateSecret1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": 1,
                  "created_at": "created_at",
                  "description": "description",
                  "disabled_at": "disabled_at",
                  "disabled_reason": "disabled_reason",
                  "enabled": true,
                  "event": "event",
                  "events": [
                    "events"
                  ],
                  "id": 1,
                  "last_delivery_at": "last_delivery_at",
                  "last_delivery_error": "last_delivery_error",
                  "last_delivery_status": 1.1,
                  "payload_format": "payload_format",
                  "secret": "secret",
                  "target_url": "target_url",
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PostApiV1AccountsAccountIdWebhookSubscriptionsIdRotateSecretResponse(
            accountId: 1,
            createdAt: "created_at",
            description: "description",
            disabledAt: "disabled_at",
            disabledReason: "disabled_reason",
            enabled: true,
            event: "event",
            events: [
                "events"
            ],
            id: 1,
            lastDeliveryAt: "last_delivery_at",
            lastDeliveryError: "last_delivery_error",
            lastDeliveryStatus: 1.1,
            payloadFormat: "payload_format",
            secret: "secret",
            targetUrl: "target_url",
            updatedAt: "updated_at"
        )
        let response = try await client.webhookSubscriptions.postApiV1AccountsAccountIdWebhookSubscriptionsIdRotateSecret(
            accountId: "1",
            id: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func postApiV1AccountsAccountIdWebhookSubscriptionsIdTest1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "delivered": true,
                  "error": "error",
                  "event_id": "event_id",
                  "status": 1.1
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PostApiV1AccountsAccountIdWebhookSubscriptionsIdTestResponse(
            delivered: true,
            error: "error",
            eventId: "event_id",
            status: 1.1
        )
        let response = try await client.webhookSubscriptions.postApiV1AccountsAccountIdWebhookSubscriptionsIdTest(
            accountId: "1",
            id: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}