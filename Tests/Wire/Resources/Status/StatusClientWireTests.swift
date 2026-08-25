import Foundation
import Testing
import Leal

@Suite("StatusClient Wire Tests") struct StatusClientWireTests {
    @Test func check1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "api_version": "api_version",
                  "authentication": "authentication",
                  "developer_portal_url": "developer_portal_url",
                  "documentation_url": "documentation_url",
                  "openapi_url": "openapi_url",
                  "rate_limit": {
                    "limit": 1,
                    "scope": "scope",
                    "window_seconds": 1
                  },
                  "status": "status",
                  "versioning": {
                    "current": "current",
                    "deprecated": [
                      "deprecated"
                    ],
                    "policy_url": "policy_url",
                    "signalling": "signalling",
                    "supported": [
                      "supported"
                    ]
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
        let expectedResponse = CheckStatusResponse(
            apiVersion: "api_version",
            authentication: "authentication",
            developerPortalUrl: "developer_portal_url",
            documentationUrl: "documentation_url",
            openapiUrl: "openapi_url",
            rateLimit: CheckStatusResponseRateLimit(
                limit: 1,
                scope: "scope",
                windowSeconds: 1
            ),
            status: "status",
            versioning: CheckStatusResponseVersioning(
                current: "current",
                deprecated: [
                    "deprecated"
                ],
                policyUrl: "policy_url",
                signalling: "signalling",
                supported: [
                    "supported"
                ]
            )
        )
        let response = try await client.status.check(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}