import Foundation
import Testing
import Leal

@Suite("StoresClient Wire Tests") struct StoresClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                [
                  {
                    "cards_count": 1,
                    "created_at": "created_at",
                    "customers_count": 1,
                    "display_store_name": "display_store_name",
                    "id": 1,
                    "locations_count": 1,
                    "name": "name",
                    "personal": true,
                    "posters_count": 1,
                    "store_name": "store_name",
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
            ListStoresResponseItem(
                cardsCount: 1,
                createdAt: "created_at",
                customersCount: 1,
                displayStoreName: "display_store_name",
                id: 1,
                locationsCount: 1,
                name: "name",
                personal: true,
                postersCount: 1,
                storeName: "store_name",
                updatedAt: "updated_at"
            )
        ]
        let response = try await client.stores.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func get1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "cards_count": 1,
                  "created_at": "created_at",
                  "customers_count": 1,
                  "display_store_name": "display_store_name",
                  "id": 1,
                  "locations_count": 1,
                  "name": "name",
                  "personal": true,
                  "posters_count": 1,
                  "store_name": "store_name",
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
        let expectedResponse = GetStoresResponse(
            cardsCount: 1,
            createdAt: "created_at",
            customersCount: 1,
            displayStoreName: "display_store_name",
            id: 1,
            locationsCount: 1,
            name: "name",
            personal: true,
            postersCount: 1,
            storeName: "store_name",
            updatedAt: "updated_at"
        )
        let response = try await client.stores.get(
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
                  "cards_count": 1,
                  "created_at": "created_at",
                  "customers_count": 1,
                  "display_store_name": "display_store_name",
                  "id": 1,
                  "locations_count": 1,
                  "name": "name",
                  "personal": true,
                  "posters_count": 1,
                  "store_name": "store_name",
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
        let expectedResponse = UpdateStoresResponse(
            cardsCount: 1,
            createdAt: "created_at",
            customersCount: 1,
            displayStoreName: "display_store_name",
            id: 1,
            locationsCount: 1,
            name: "name",
            personal: true,
            postersCount: 1,
            storeName: "store_name",
            updatedAt: "updated_at"
        )
        let response = try await client.stores.update(
            id: "1",
            request: .init(account: UpdateStoresRequestAccount(

            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}