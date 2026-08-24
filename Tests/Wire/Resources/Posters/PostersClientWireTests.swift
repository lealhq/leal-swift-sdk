import Foundation
import Testing
import Leal

@Suite("PostersClient Wire Tests") struct PostersClientWireTests {
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
                    "display_url": "display_url",
                    "id": 1,
                    "paper_size": "paper_size",
                    "primary_color": "primary_color",
                    "qr_code_url": "qr_code_url",
                    "secondary_color": "secondary_color",
                    "signup_url": "signup_url",
                    "text_color": "text_color",
                    "title": "title",
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
            ListPostersResponseItem(
                accountId: 1,
                active: true,
                cardId: 1,
                createdAt: "created_at",
                displayUrl: "display_url",
                id: 1,
                paperSize: "paper_size",
                primaryColor: "primary_color",
                qrCodeUrl: "qr_code_url",
                secondaryColor: "secondary_color",
                signupUrl: "signup_url",
                textColor: "text_color",
                title: "title",
                updatedAt: "updated_at"
            )
        ]
        let response = try await client.posters.list(
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
                  "display_url": "display_url",
                  "id": 1,
                  "paper_size": "paper_size",
                  "primary_color": "primary_color",
                  "qr_code_url": "qr_code_url",
                  "secondary_color": "secondary_color",
                  "signup_url": "signup_url",
                  "text_color": "text_color",
                  "title": "title",
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
        let expectedResponse = CreatePostersResponse(
            accountId: 1,
            active: true,
            cardId: 1,
            createdAt: "created_at",
            displayUrl: "display_url",
            id: 1,
            paperSize: "paper_size",
            primaryColor: "primary_color",
            qrCodeUrl: "qr_code_url",
            secondaryColor: "secondary_color",
            signupUrl: "signup_url",
            textColor: "text_color",
            title: "title",
            updatedAt: "updated_at"
        )
        let response = try await client.posters.create(
            accountId: "1",
            request: .init(poster: CreatePostersRequestPoster(
                cardId: 1
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
                  "display_url": "display_url",
                  "id": 1,
                  "paper_size": "paper_size",
                  "primary_color": "primary_color",
                  "qr_code_url": "qr_code_url",
                  "secondary_color": "secondary_color",
                  "signup_url": "signup_url",
                  "text_color": "text_color",
                  "title": "title",
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
        let expectedResponse = GetPostersResponse(
            accountId: 1,
            active: true,
            cardId: 1,
            createdAt: "created_at",
            displayUrl: "display_url",
            id: 1,
            paperSize: "paper_size",
            primaryColor: "primary_color",
            qrCodeUrl: "qr_code_url",
            secondaryColor: "secondary_color",
            signupUrl: "signup_url",
            textColor: "text_color",
            title: "title",
            updatedAt: "updated_at"
        )
        let response = try await client.posters.get(
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
                  "display_url": "display_url",
                  "id": 1,
                  "paper_size": "paper_size",
                  "primary_color": "primary_color",
                  "qr_code_url": "qr_code_url",
                  "secondary_color": "secondary_color",
                  "signup_url": "signup_url",
                  "text_color": "text_color",
                  "title": "title",
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
        let expectedResponse = UpdatePostersResponse(
            accountId: 1,
            active: true,
            cardId: 1,
            createdAt: "created_at",
            displayUrl: "display_url",
            id: 1,
            paperSize: "paper_size",
            primaryColor: "primary_color",
            qrCodeUrl: "qr_code_url",
            secondaryColor: "secondary_color",
            signupUrl: "signup_url",
            textColor: "text_color",
            title: "title",
            updatedAt: "updated_at"
        )
        let response = try await client.posters.update(
            accountId: "1",
            id: "1",
            request: .init(poster: UpdatePostersRequestPoster(

            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}