import Foundation
import Testing
import Leal

@Suite("RewardsClient Wire Tests") struct RewardsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                [
                  {
                    "account_id": 1,
                    "active": true,
                    "card_id": 1,
                    "created_at": "created_at",
                    "description": "description",
                    "id": 1,
                    "name": "name",
                    "position": 1,
                    "stamps_required": 1,
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
            ListRewardsResponseItem(
                accountId: 1,
                active: true,
                cardId: 1,
                createdAt: "created_at",
                description: "description",
                id: 1,
                name: "name",
                position: 1,
                stampsRequired: 1,
                updatedAt: "updated_at"
            )
        ]
        let response = try await client.rewards.list(
            accountId: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": 1,
                  "active": true,
                  "card_id": 1,
                  "created_at": "created_at",
                  "description": "description",
                  "id": 1,
                  "name": "name",
                  "position": 1,
                  "stamps_required": 1,
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
        let expectedResponse = CreateRewardsResponse(
            accountId: 1,
            active: true,
            cardId: 1,
            createdAt: "created_at",
            description: "description",
            id: 1,
            name: "name",
            position: 1,
            stampsRequired: 1,
            updatedAt: "updated_at"
        )
        let response = try await client.rewards.create(
            accountId: "1",
            request: .init(reward: CreateRewardsRequestReward(
                cardId: 1,
                name: "name",
                stampsRequired: 1
            )),
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
                  "active": true,
                  "card_id": 1,
                  "created_at": "created_at",
                  "description": "description",
                  "id": 1,
                  "name": "name",
                  "position": 1,
                  "stamps_required": 1,
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
        let expectedResponse = GetRewardsResponse(
            accountId: 1,
            active: true,
            cardId: 1,
            createdAt: "created_at",
            description: "description",
            id: 1,
            name: "name",
            position: 1,
            stampsRequired: 1,
            updatedAt: "updated_at"
        )
        let response = try await client.rewards.get(
            accountId: "1",
            id: "1",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": 1,
                  "active": true,
                  "card_id": 1,
                  "created_at": "created_at",
                  "description": "description",
                  "id": 1,
                  "name": "name",
                  "position": 1,
                  "stamps_required": 1,
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
        let expectedResponse = UpdateRewardsResponse(
            accountId: 1,
            active: true,
            cardId: 1,
            createdAt: "created_at",
            description: "description",
            id: 1,
            name: "name",
            position: 1,
            stampsRequired: 1,
            updatedAt: "updated_at"
        )
        let response = try await client.rewards.update(
            accountId: "1",
            id: "1",
            request: .init(reward: UpdateRewardsRequestReward(

            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}