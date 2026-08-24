import Foundation
import Testing
import Leal

@Suite("CustomerCardsClient Wire Tests") struct CustomerCardsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                [
                  {
                    "apple_wallet_url": "apple_wallet_url",
                    "card_id": 1,
                    "card_name": "card_name",
                    "created_at": "created_at",
                    "google_wallet_url": "google_wallet_url",
                    "id": 1,
                    "issued_at": "issued_at",
                    "pass_installed": true,
                    "progress_percentage": 1.1,
                    "stamps_count": 1,
                    "stamps_remaining": 1,
                    "status": "status",
                    "updated_at": "updated_at",
                    "uuid": "uuid"
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
            ListCustomerCardsResponseItem(
                appleWalletUrl: "apple_wallet_url",
                cardId: 1,
                cardName: "card_name",
                createdAt: "created_at",
                googleWalletUrl: "google_wallet_url",
                id: 1,
                issuedAt: "issued_at",
                passInstalled: true,
                progressPercentage: 1.1,
                stampsCount: 1,
                stampsRemaining: 1,
                status: "status",
                updatedAt: "updated_at",
                uuid: "uuid"
            )
        ]
        let response = try await client.customerCards.list(
            accountId: "1",
            customerId: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func get1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": 1,
                  "apple_wallet_url": "apple_wallet_url",
                  "available_rewards": [
                    "available_rewards"
                  ],
                  "card_id": 1,
                  "card_name": "card_name",
                  "created_at": "created_at",
                  "customer_id": 1,
                  "google_wallet_url": "google_wallet_url",
                  "id": 1,
                  "issued_at": "issued_at",
                  "pass_installed": true,
                  "progress_percentage": 1.1,
                  "stamps_count": 1,
                  "stamps_remaining": 1,
                  "status": "status",
                  "updated_at": "updated_at",
                  "uuid": "uuid"
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetCustomerCardsResponse(
            accountId: 1,
            appleWalletUrl: "apple_wallet_url",
            availableRewards: [
                "available_rewards"
            ],
            cardId: 1,
            cardName: "card_name",
            createdAt: "created_at",
            customerId: 1,
            googleWalletUrl: "google_wallet_url",
            id: 1,
            issuedAt: "issued_at",
            passInstalled: true,
            progressPercentage: 1.1,
            stampsCount: 1,
            stampsRemaining: 1,
            status: "status",
            updatedAt: "updated_at",
            uuid: "uuid"
        )
        let response = try await client.customerCards.get(
            accountId: "1",
            customerId: "1",
            id: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func redeem1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "redemption": {
                    "id": 1,
                    "redeemed_at": "redeemed_at",
                    "reward_id": 1,
                    "reward_name": "reward_name",
                    "stamps_remaining": 1,
                    "stamps_spent": 1
                  },
                  "success": true
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RedeemCustomerCardsResponse(
            redemption: RedeemCustomerCardsResponseRedemption(
                id: 1,
                redeemedAt: "redeemed_at",
                rewardId: 1,
                rewardName: "reward_name",
                stampsRemaining: 1,
                stampsSpent: 1
            ),
            success: true
        )
        let response = try await client.customerCards.redeem(
            accountId: "1",
            customerId: "1",
            id: "1",
            request: .init(rewardId: 1),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func stamp1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": 1,
                  "apple_wallet_url": "apple_wallet_url",
                  "available_rewards": [
                    "available_rewards"
                  ],
                  "card_id": 1,
                  "card_name": "card_name",
                  "created_at": "created_at",
                  "customer_id": 1,
                  "google_wallet_url": "google_wallet_url",
                  "id": 1,
                  "issued_at": "issued_at",
                  "pass_installed": true,
                  "progress_percentage": 1.1,
                  "stamps_count": 1,
                  "stamps_remaining": 1,
                  "status": "status",
                  "updated_at": "updated_at",
                  "uuid": "uuid"
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = StampCustomerCardsResponse(
            accountId: 1,
            appleWalletUrl: "apple_wallet_url",
            availableRewards: [
                "available_rewards"
            ],
            cardId: 1,
            cardName: "card_name",
            createdAt: "created_at",
            customerId: 1,
            googleWalletUrl: "google_wallet_url",
            id: 1,
            issuedAt: "issued_at",
            passInstalled: true,
            progressPercentage: 1.1,
            stampsCount: 1,
            stampsRemaining: 1,
            status: "status",
            updatedAt: "updated_at",
            uuid: "uuid"
        )
        let response = try await client.customerCards.stamp(
            accountId: "1",
            customerId: "1",
            id: "1",
            request: .init(stamps: 1),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}