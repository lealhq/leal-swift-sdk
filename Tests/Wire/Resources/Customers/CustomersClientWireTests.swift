import Foundation
import Testing
import Leal

@Suite("CustomersClient Wire Tests") struct CustomersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "customers": [
                    "customers"
                  ],
                  "pagination": {
                    "count": 1,
                    "items": 1,
                    "page": 1,
                    "pages": 1
                  }
                }
                """#.utf8
            )
        )
        let client = LealClient(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListCustomersResponse(
            customers: [
                "customers"
            ],
            pagination: ListCustomersResponsePagination(
                count: 1,
                items: 1,
                page: 1,
                pages: 1
            )
        )
        let response = try await client.customers.list(
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
                  "birthday": "birthday",
                  "created_at": "created_at",
                  "customer_cards": [
                    "customer_cards"
                  ],
                  "email": "email",
                  "external_references": [
                    "external_references"
                  ],
                  "first_name": "first_name",
                  "id": 1,
                  "last_name": "last_name",
                  "metadata": {
                    "key": "value"
                  },
                  "phone": "phone",
                  "stamp_count": 1,
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
        let expectedResponse = CreateCustomersResponse(
            accountId: 1,
            birthday: "birthday",
            createdAt: "created_at",
            customerCards: [
                "customer_cards"
            ],
            email: "email",
            externalReferences: [
                "external_references"
            ],
            firstName: "first_name",
            id: 1,
            lastName: "last_name",
            metadata: [
                "key": JSONValue.string("value")
            ],
            phone: "phone",
            stampCount: 1,
            updatedAt: "updated_at"
        )
        let response = try await client.customers.create(
            accountId: "1",
            request: .init(customer: CreateCustomersRequestCustomer(
                firstName: "first_name"
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
                  "birthday": "birthday",
                  "created_at": "created_at",
                  "customer_cards": [
                    "customer_cards"
                  ],
                  "email": "email",
                  "external_references": [
                    "external_references"
                  ],
                  "first_name": "first_name",
                  "id": 1,
                  "last_name": "last_name",
                  "metadata": {
                    "key": "value"
                  },
                  "phone": "phone",
                  "stamp_count": 1,
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
        let expectedResponse = GetCustomersResponse(
            accountId: 1,
            birthday: "birthday",
            createdAt: "created_at",
            customerCards: [
                "customer_cards"
            ],
            email: "email",
            externalReferences: [
                "external_references"
            ],
            firstName: "first_name",
            id: 1,
            lastName: "last_name",
            metadata: [
                "key": JSONValue.string("value")
            ],
            phone: "phone",
            stampCount: 1,
            updatedAt: "updated_at"
        )
        let response = try await client.customers.get(
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
                  "birthday": "birthday",
                  "created_at": "created_at",
                  "customer_cards": [
                    "customer_cards"
                  ],
                  "email": "email",
                  "external_references": [
                    "external_references"
                  ],
                  "first_name": "first_name",
                  "id": 1,
                  "last_name": "last_name",
                  "metadata": {
                    "key": "value"
                  },
                  "phone": "phone",
                  "stamp_count": 1,
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
        let expectedResponse = UpdateCustomersResponse(
            accountId: 1,
            birthday: "birthday",
            createdAt: "created_at",
            customerCards: [
                "customer_cards"
            ],
            email: "email",
            externalReferences: [
                "external_references"
            ],
            firstName: "first_name",
            id: 1,
            lastName: "last_name",
            metadata: [
                "key": JSONValue.string("value")
            ],
            phone: "phone",
            stampCount: 1,
            updatedAt: "updated_at"
        )
        let response = try await client.customers.update(
            accountId: "1",
            id: "1",
            request: .init(customer: UpdateCustomersRequestCustomer(

            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}