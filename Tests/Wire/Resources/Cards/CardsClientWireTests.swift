import Foundation
import Testing
import Leal

@Suite("CardsClient Wire Tests") struct CardsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                [
                  {
                    "archived_at": "archived_at",
                    "auxiliary_fields": [
                      "auxiliary_fields"
                    ],
                    "card_color": "card_color",
                    "created_at": "created_at",
                    "customer_cards_count": 1,
                    "expires_at": "expires_at",
                    "header_text": "header_text",
                    "id": 1,
                    "initial_stamps": 1,
                    "name": "name",
                    "rewards_count": 1,
                    "show_member_field": true,
                    "show_stamps_to_reward_field": true,
                    "stamp_background_color": "stamp_background_color",
                    "stamp_color": "stamp_color",
                    "stamp_icon": "stamp_icon",
                    "stamps_required": 1,
                    "strip_color": "strip_color",
                    "strip_preset": "strip_preset",
                    "strip_type": "strip_type",
                    "text_color": "text_color",
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
            ListCardsResponseItem(
                archivedAt: "archived_at",
                auxiliaryFields: [
                    "auxiliary_fields"
                ],
                cardColor: "card_color",
                createdAt: "created_at",
                customerCardsCount: 1,
                expiresAt: "expires_at",
                headerText: "header_text",
                id: 1,
                initialStamps: 1,
                name: "name",
                rewardsCount: 1,
                showMemberField: true,
                showStampsToRewardField: true,
                stampBackgroundColor: "stamp_background_color",
                stampColor: "stamp_color",
                stampIcon: "stamp_icon",
                stampsRequired: 1,
                stripColor: "strip_color",
                stripPreset: "strip_preset",
                stripType: "strip_type",
                textColor: "text_color",
                updatedAt: "updated_at"
            )
        ]
        let response = try await client.cards.list(
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
                  "archived_at": "archived_at",
                  "auxiliary_fields": [
                    "auxiliary_fields"
                  ],
                  "card_color": "card_color",
                  "created_at": "created_at",
                  "customer_cards_count": 1,
                  "expires_at": "expires_at",
                  "header_text": "header_text",
                  "id": 1,
                  "initial_stamps": 1,
                  "name": "name",
                  "rewards_count": 1,
                  "show_member_field": true,
                  "show_stamps_to_reward_field": true,
                  "stamp_background_color": "stamp_background_color",
                  "stamp_color": "stamp_color",
                  "stamp_icon": "stamp_icon",
                  "stamps_required": 1,
                  "strip_color": "strip_color",
                  "strip_preset": "strip_preset",
                  "strip_type": "strip_type",
                  "text_color": "text_color",
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
        let expectedResponse = CreateCardsResponse(
            archivedAt: "archived_at",
            auxiliaryFields: [
                "auxiliary_fields"
            ],
            cardColor: "card_color",
            createdAt: "created_at",
            customerCardsCount: 1,
            expiresAt: "expires_at",
            headerText: "header_text",
            id: 1,
            initialStamps: 1,
            name: "name",
            rewardsCount: 1,
            showMemberField: true,
            showStampsToRewardField: true,
            stampBackgroundColor: "stamp_background_color",
            stampColor: "stamp_color",
            stampIcon: "stamp_icon",
            stampsRequired: 1,
            stripColor: "strip_color",
            stripPreset: "strip_preset",
            stripType: "strip_type",
            textColor: "text_color",
            updatedAt: "updated_at"
        )
        let response = try await client.cards.create(
            accountId: "1",
            request: .init(card: CreateCardsRequestCard(
                name: "name"
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
                  "archived_at": "archived_at",
                  "auxiliary_fields": [
                    "auxiliary_fields"
                  ],
                  "card_color": "card_color",
                  "created_at": "created_at",
                  "customer_cards_count": 1,
                  "expires_at": "expires_at",
                  "header_text": "header_text",
                  "id": 1,
                  "initial_stamps": 1,
                  "name": "name",
                  "rewards_count": 1,
                  "show_member_field": true,
                  "show_stamps_to_reward_field": true,
                  "stamp_background_color": "stamp_background_color",
                  "stamp_color": "stamp_color",
                  "stamp_icon": "stamp_icon",
                  "stamps_required": 1,
                  "strip_color": "strip_color",
                  "strip_preset": "strip_preset",
                  "strip_type": "strip_type",
                  "text_color": "text_color",
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
        let expectedResponse = GetCardsResponse(
            archivedAt: "archived_at",
            auxiliaryFields: [
                "auxiliary_fields"
            ],
            cardColor: "card_color",
            createdAt: "created_at",
            customerCardsCount: 1,
            expiresAt: "expires_at",
            headerText: "header_text",
            id: 1,
            initialStamps: 1,
            name: "name",
            rewardsCount: 1,
            showMemberField: true,
            showStampsToRewardField: true,
            stampBackgroundColor: "stamp_background_color",
            stampColor: "stamp_color",
            stampIcon: "stamp_icon",
            stampsRequired: 1,
            stripColor: "strip_color",
            stripPreset: "strip_preset",
            stripType: "strip_type",
            textColor: "text_color",
            updatedAt: "updated_at"
        )
        let response = try await client.cards.get(
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
                  "archived_at": "archived_at",
                  "auxiliary_fields": [
                    "auxiliary_fields"
                  ],
                  "card_color": "card_color",
                  "created_at": "created_at",
                  "customer_cards_count": 1,
                  "expires_at": "expires_at",
                  "header_text": "header_text",
                  "id": 1,
                  "initial_stamps": 1,
                  "name": "name",
                  "rewards_count": 1,
                  "show_member_field": true,
                  "show_stamps_to_reward_field": true,
                  "stamp_background_color": "stamp_background_color",
                  "stamp_color": "stamp_color",
                  "stamp_icon": "stamp_icon",
                  "stamps_required": 1,
                  "strip_color": "strip_color",
                  "strip_preset": "strip_preset",
                  "strip_type": "strip_type",
                  "text_color": "text_color",
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
        let expectedResponse = UpdateCardsResponse(
            archivedAt: "archived_at",
            auxiliaryFields: [
                "auxiliary_fields"
            ],
            cardColor: "card_color",
            createdAt: "created_at",
            customerCardsCount: 1,
            expiresAt: "expires_at",
            headerText: "header_text",
            id: 1,
            initialStamps: 1,
            name: "name",
            rewardsCount: 1,
            showMemberField: true,
            showStampsToRewardField: true,
            stampBackgroundColor: "stamp_background_color",
            stampColor: "stamp_color",
            stampIcon: "stamp_icon",
            stampsRequired: 1,
            stripColor: "strip_color",
            stripPreset: "strip_preset",
            stripType: "strip_type",
            textColor: "text_color",
            updatedAt: "updated_at"
        )
        let response = try await client.cards.update(
            accountId: "1",
            id: "1",
            request: .init(card: UpdateCardsRequestCard(

            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}