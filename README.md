# Leal Swift Library

[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-Built%20with%20Fern-brightgreen)](https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=https%3A%2F%2Fgithub.com%2Flealhq%2Fleal-swift-sdk)
![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)

Digital loyalty stamp cards in Apple Wallet and Google Wallet, for local
businesses. This library covers the whole [Leal](https://www.getleal.com)
API, so you can enrol customers, add stamps, redeem rewards and read a
card's wallet links from your own application.

- Guides and a page for every language: [www.getleal.com/developers](https://www.getleal.com/developers)
- Create an API token: [app.getleal.com/api_tokens](https://app.getleal.com/api_tokens)
- The OpenAPI description these libraries are built from: [www.getleal.com/openapi.json](https://www.getleal.com/openapi.json)


## Table of Contents

- [Documentation](#documentation)
- [Requirements](#requirements)
- [Installation](#installation)
- [Reference](#reference)
- [Usage](#usage)
- [Environments](#environments)
- [Errors](#errors)
- [Request Types](#request-types)
- [Advanced](#advanced)
  - [Additional Headers](#additional-headers)
  - [Additional Query String Parameters](#additional-query-string-parameters)
  - [Timeouts](#timeouts)
  - [Custom Networking Client](#custom-networking-client)
- [Contributing](#contributing)

## Documentation

API reference documentation is available [here](https://app.getleal.com/docs/api.html).

## Requirements

This SDK requires:
- Swift 5.7+
- iOS 15+
- macOS 12+
- tvOS 15+
- watchOS 8+

## Installation

With Swift Package Manager (SPM), add the following to the top-level `dependencies` array within your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/lealhq/leal-swift-sdk", from: "0.0.22"),
]
```

## Reference

A full reference for this library is available [here](https://github.com/lealhq/leal-swift-sdk/blob/HEAD/./reference.md).

## Usage

Instantiate and use the client with the following:

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.customerCards.stamp(
        accountId: "1",
        customerId: "1",
        id: "1",
        request: .init(stamps: 1)
    )
}

try await main()
```

## Environments

This SDK allows you to configure different environments for API requests.

```swift
import Leal

let client = LealClient(
    token: "YOUR_API_KEY",
    environment: .production
)
```

## Errors

The SDK throws a single error enum for all failures. Client-side issues encoding/decoding failures and network errors use dedicated cases, while non-success HTTP responses are wrapped in an `HTTPError` that exposes the status code, a simple classification and an optional decoded message.

```swift
import Leal

let client = LealClient(token: "YOUR_API_KEY")

do {
    let response = try await client.customerCards.stamp(...)
    // Handle successful response
} catch let error as LealError {
    switch error {
    case .httpError(let httpError):
        print("Status code:", httpError.statusCode)
        print("Kind:", httpError.kind)
        print("Message:", httpError.body?.message ?? httpError.localizedDescription)
    case .encodingError(let underlying):
        print("Encoding error:", underlying)
    case .networkError(let underlying):
        print("Network error:", underlying)
    default:
        print("Other client error:", error)
    }
} catch {
    print("Unexpected error:", error)
}
```

## Request Types

The SDK exports all request types as Swift structs. Simply import the SDK module to access them:

```swift
import Leal

let request = Requests.UpdateStoresRequest(
    ...
)
```

## Advanced

### Additional Headers

If you would like to send additional headers as part of the request, use the `additionalHeaders` request option.

```swift
try await client.customerCards.stamp(..., requestOptions: .init(
    additionalHeaders: [
        "X-Custom-Header": "custom value"
    ]
))
```

### Additional Query String Parameters

If you would like to send additional query string parameters as part of the request, use the `additionalQueryParameters` request option.

```swift
try await client.customerCards.stamp(..., requestOptions: .init(
    additionalQueryParameters: [
        "custom_query_param_key": "custom_query_param_value"
    ]
))
```

### Timeouts

The SDK defaults to a 60-second timeout. Use the `timeout` option to configure this behavior.

```swift
try await client.customerCards.stamp(..., requestOptions: .init(
    timeout: 30
))
```

### Custom Networking Client

The SDK allows you to customize the underlying `URLSession` used for HTTP requests. Use the `urlSession` option to provide your own configured `URLSession` instance.

```swift
import Foundation
import Leal

let client = LealClient(
    token: "YOUR_API_KEY",
    urlSession: // Provide your implementation here
)
```

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically.
Additions made directly to this library would have to be moved over to our generation code,
otherwise they would be overwritten upon the next generated release. Feel free to open a PR as
a proof of concept, but know that we will not be able to merge it as-is. We suggest opening
an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
