import Foundation
import Testing
import Leal

@Suite("LocationsClient Wire Tests") struct LocationsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                [
                  {
                    "account_id": 1,
                    "address": "address",
                    "created_at": "created_at",
                    "id": 1,
                    "latitude": 1.1,
                    "longitude": 1.1,
                    "name": "name",
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
            ListLocationsResponseItem(
                accountId: 1,
                address: "address",
                createdAt: "created_at",
                id: 1,
                latitude: 1.1,
                longitude: 1.1,
                name: "name",
                updatedAt: "updated_at"
            )
        ]
        let response = try await client.locations.list(
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
                  "address": "address",
                  "created_at": "created_at",
                  "id": 1,
                  "latitude": 1.1,
                  "longitude": 1.1,
                  "name": "name",
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
        let expectedResponse = CreateLocationsResponse(
            accountId: 1,
            address: "address",
            createdAt: "created_at",
            id: 1,
            latitude: 1.1,
            longitude: 1.1,
            name: "name",
            updatedAt: "updated_at"
        )
        let response = try await client.locations.create(
            accountId: "1",
            request: .init(location: CreateLocationsRequestLocation(
                address: "address",
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
                  "account_id": 1,
                  "address": "address",
                  "created_at": "created_at",
                  "id": 1,
                  "latitude": 1.1,
                  "longitude": 1.1,
                  "name": "name",
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
        let expectedResponse = GetLocationsResponse(
            accountId: 1,
            address: "address",
            createdAt: "created_at",
            id: 1,
            latitude: 1.1,
            longitude: 1.1,
            name: "name",
            updatedAt: "updated_at"
        )
        let response = try await client.locations.get(
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
                  "address": "address",
                  "created_at": "created_at",
                  "id": 1,
                  "latitude": 1.1,
                  "longitude": 1.1,
                  "name": "name",
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
        let expectedResponse = UpdateLocationsResponse(
            accountId: 1,
            address: "address",
            createdAt: "created_at",
            id: 1,
            latitude: 1.1,
            longitude: 1.1,
            name: "name",
            updatedAt: "updated_at"
        )
        let response = try await client.locations.update(
            accountId: "1",
            id: "1",
            request: .init(location: UpdateLocationsRequestLocation(

            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}