# Reference
## Stores
<details><summary><code>client.stores.<a href="/Sources/Resources/Stores/StoresClient.swift">list</a>(requestOptions: RequestOptions?) -> [ListStoresResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns every store the authenticated user has access to, including summary counts for locations, cards, customers, and posters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.stores.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stores.<a href="/Sources/Resources/Stores/StoresClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> GetStoresResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns detailed information for a single store, including summary counts for its associated resources.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.stores.get(id: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Store ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stores.<a href="/Sources/Resources/Stores/StoresClient.swift">update</a>(id: String, request: Requests.UpdateStoresRequest, requestOptions: RequestOptions?) -> UpdateStoresResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the store's name or store_name. Use `store_name` for the public-facing name displayed to customers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.stores.update(
        id: "1",
        request: .init(account: UpdateStoresRequestAccount(

        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Store ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateStoresRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Cards
<details><summary><code>client.cards.<a href="/Sources/Resources/Cards/CardsClient.swift">list</a>(accountId: String, scope: String?, requestOptions: RequestOptions?) -> [ListCardsResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns loyalty card templates for the specified store. By default, only
active (unarchived) cards are returned. Use the `scope` parameter to include
archived cards.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.cards.list(accountId: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**scope:** `String?` — Filter cards by archive status. Default: active only.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cards.<a href="/Sources/Resources/Cards/CardsClient.swift">create</a>(accountId: String, request: Requests.CreateCardsRequest, requestOptions: RequestOptions?) -> CreateCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new loyalty stamp card template for the store. The card defines the
visual design (colours, icon, strip) and program rules (stamps required,
initial stamps).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.cards.create(
        accountId: "1",
        request: .init(card: CreateCardsRequestCard(
            name: "name"
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CreateCardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cards.<a href="/Sources/Resources/Cards/CardsClient.swift">get</a>(accountId: String, id: String, requestOptions: RequestOptions?) -> GetCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single loyalty card template by ID, including reward and customer card counts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.cards.get(
        accountId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Card ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cards.<a href="/Sources/Resources/Cards/CardsClient.swift">update</a>(accountId: String, id: String, request: Requests.UpdateCardsRequest, requestOptions: RequestOptions?) -> UpdateCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing loyalty card template. Only the provided attributes are changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.cards.update(
        accountId: "1",
        id: "1",
        request: .init(card: UpdateCardsRequestCard(

        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Card ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateCardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Customers
<details><summary><code>client.customers.<a href="/Sources/Resources/Customers/CustomersClient.swift">list</a>(accountId: String, search: String?, source: String?, externalId: String?, page: Int?, items: Int?, requestOptions: RequestOptions?) -> ListCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of customers for the store. Use the `search` parameter to filter
by name, email, phone, card code (barcode), or external reference ID. Alternatively, pass
`source` AND `external_id` together to perform an exact lookup by an external reference -
the response will contain at most one customer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.customers.list(accountId: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**search:** `String?` — Search query to filter customers by name, email, phone, card code (barcode), or external reference ID
    
</dd>
</dl>

<dl>
<dd>

**source:** `String?` — External system slug (e.g. `square`, `shopify`). When combined with `external_id`, performs an exact lookup.
    
</dd>
</dl>

<dl>
<dd>

**externalId:** `String?` — External system's identifier for the customer. Must be combined with `source`.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` — Page number (defaults to 1)
    
</dd>
</dl>

<dl>
<dd>

**items:** `Int?` — Number of items per page
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.customers.<a href="/Sources/Resources/Customers/CustomersClient.swift">create</a>(accountId: String, request: Requests.CreateCustomersRequest, requestOptions: RequestOptions?) -> CreateCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new customer for the store. Requires `first_name` and at least one of `email` or `phone`.
Optionally enroll the customer in a loyalty card by passing `card_id`, and trigger delivery of
card links (email/SMS) by passing `send_card_links`. When a card with initial stamps is assigned,
those stamps are automatically applied as a welcome bonus.

Pass `metadata` to attach arbitrary key/value data, and `external_references` to link the
customer to records in other systems (e.g. Square, Shopify). External references are upserted
by `(source, external_id)` so this endpoint is safe to call with the same references twice.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.customers.create(
        accountId: "1",
        request: .init(customer: CreateCustomersRequestCustomer(
            firstName: "first_name"
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CreateCustomersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.customers.<a href="/Sources/Resources/Customers/CustomersClient.swift">get</a>(accountId: String, id: String, requestOptions: RequestOptions?) -> GetCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns detailed information about a single customer, including all of their
enrolled loyalty cards with stamp progress and wallet pass URLs (`apple_wallet_url`
and `google_wallet_url`) for each card. Also includes `metadata` and
`external_references` so you can sync state with external systems.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.customers.get(
        accountId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Customer ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.customers.<a href="/Sources/Resources/Customers/CustomersClient.swift">update</a>(accountId: String, id: String, request: Requests.UpdateCustomersRequest, requestOptions: RequestOptions?) -> UpdateCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing customer's details. To add stamps or redeem rewards, use the
customer cards endpoints instead.

`metadata` is shallow-merged into the existing metadata. `external_references` are upserted
by `(source, external_id)` - to remove a reference, omit it from subsequent calls and use
a separate `DELETE` workflow (not yet exposed via API; manage in dashboard for now).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.customers.update(
        accountId: "1",
        id: "1",
        request: .init(customer: UpdateCustomersRequestCustomer(

        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Customer ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateCustomersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Customer Cards
<details><summary><code>client.customerCards.<a href="/Sources/Resources/CustomerCards/CustomerCardsClient.swift">list</a>(accountId: String, customerId: String, requestOptions: RequestOptions?) -> [ListCustomerCardsResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all loyalty cards enrolled for a specific customer, including stamp progress,
status, wallet pass installation state, and wallet pass URLs (`apple_wallet_url` and
`google_wallet_url`) that you can use to let customers add their loyalty card to
Apple Wallet or Google Wallet from your own app or website.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.customerCards.list(
        accountId: "1",
        customerId: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — Customer ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.customerCards.<a href="/Sources/Resources/CustomerCards/CustomerCardsClient.swift">get</a>(accountId: String, customerId: String, id: String, requestOptions: RequestOptions?) -> GetCustomerCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns detailed information about a specific customer card, including stamp progress,
a list of rewards the customer has earned enough stamps to redeem, and wallet pass URLs
(`apple_wallet_url` and `google_wallet_url`) for adding the card to Apple Wallet or
Google Wallet.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.customerCards.get(
        accountId: "1",
        customerId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — Customer ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Customer card ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.customerCards.<a href="/Sources/Resources/CustomerCards/CustomerCardsClient.swift">redeem</a>(accountId: String, customerId: String, id: String, request: Requests.RedeemCustomerCardsRequest, requestOptions: RequestOptions?) -> RedeemCustomerCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Redeems a reward for a customer, deducting the required stamps from their card.
The customer must have enough stamps on this card to cover the reward's cost.
Triggers wallet pass updates and push notifications.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.customerCards.redeem(
        accountId: "1",
        customerId: "1",
        id: "1",
        request: .init(rewardId: 1)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — Customer ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Customer card ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.RedeemCustomerCardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.customerCards.<a href="/Sources/Resources/CustomerCards/CustomerCardsClient.swift">stamp</a>(accountId: String, customerId: String, id: String, request: Requests.StampCustomerCardsRequest, requestOptions: RequestOptions?) -> StampCustomerCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds stamps to a customer's loyalty card. Triggers ledger entries, wallet pass updates,
and push notifications. Pass `skip_notifications` to stamp silently.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

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
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — Customer ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Customer card ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.StampCustomerCardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Locations
<details><summary><code>client.locations.<a href="/Sources/Resources/Locations/LocationsClient.swift">list</a>(accountId: String, requestOptions: RequestOptions?) -> [ListLocationsResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns every physical location belonging to the specified store.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.locations.list(accountId: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.locations.<a href="/Sources/Resources/Locations/LocationsClient.swift">create</a>(accountId: String, request: Requests.CreateLocationsRequest, requestOptions: RequestOptions?) -> CreateLocationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new physical location for the store. The provided address is
automatically geocoded to latitude and longitude coordinates in the background.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.locations.create(
        accountId: "1",
        request: .init(location: CreateLocationsRequestLocation(
            address: "address",
            name: "name"
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CreateLocationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.locations.<a href="/Sources/Resources/Locations/LocationsClient.swift">get</a>(accountId: String, id: String, requestOptions: RequestOptions?) -> GetLocationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single location by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.locations.get(
        accountId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Location ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.locations.<a href="/Sources/Resources/Locations/LocationsClient.swift">delete</a>(accountId: String, id: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently deletes a location. This action cannot be undone.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.locations.delete(
        accountId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Location ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.locations.<a href="/Sources/Resources/Locations/LocationsClient.swift">update</a>(accountId: String, id: String, request: Requests.UpdateLocationsRequest, requestOptions: RequestOptions?) -> UpdateLocationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing location. If the address is changed, it will be re-geocoded automatically.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.locations.update(
        accountId: "1",
        id: "1",
        request: .init(location: UpdateLocationsRequestLocation(

        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Parent store ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Location ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateLocationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Posters
<details><summary><code>client.posters.<a href="/Sources/Resources/Posters/PostersClient.swift">list</a>(accountId: String, cardId: Int?, active: String?, requestOptions: RequestOptions?) -> [ListPostersResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all posters for the store. Optionally filter by card or active status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.posters.list(accountId: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**cardId:** `Int?` — Filter posters belonging to a specific card
    
</dd>
</dl>

<dl>
<dd>

**active:** `String?` — When present, return only active posters
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.posters.<a href="/Sources/Resources/Posters/PostersClient.swift">create</a>(accountId: String, request: Requests.CreatePostersRequest, requestOptions: RequestOptions?) -> CreatePostersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new printable QR code poster for customer signup. The poster will automatically
generate a unique public signup URL and QR code. The `card_id` is required on create to
associate the poster with a loyalty card.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.posters.create(
        accountId: "1",
        request: .init(poster: CreatePostersRequestPoster(
            cardId: 1
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CreatePostersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.posters.<a href="/Sources/Resources/Posters/PostersClient.swift">get</a>(accountId: String, id: String, requestOptions: RequestOptions?) -> GetPostersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single poster by ID, including generated signup and display URLs.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.posters.get(
        accountId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Poster ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.posters.<a href="/Sources/Resources/Posters/PostersClient.swift">delete</a>(accountId: String, id: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently deletes a poster. The public signup URL will stop working.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.posters.delete(
        accountId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Poster ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.posters.<a href="/Sources/Resources/Posters/PostersClient.swift">update</a>(accountId: String, id: String, request: Requests.UpdatePostersRequest, requestOptions: RequestOptions?) -> UpdatePostersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing poster. The `card_id` cannot be changed after creation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.posters.update(
        accountId: "1",
        id: "1",
        request: .init(poster: UpdatePostersRequestPoster(

        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Poster ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdatePostersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Rewards
<details><summary><code>client.rewards.<a href="/Sources/Resources/Rewards/RewardsClient.swift">list</a>(accountId: String, cardId: Int?, active: String?, requestOptions: RequestOptions?) -> [ListRewardsResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all rewards for the store. Optionally filter by card or active status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.rewards.list(accountId: "1")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**cardId:** `Int?` — Filter rewards belonging to a specific card
    
</dd>
</dl>

<dl>
<dd>

**active:** `String?` — When present, return only active rewards
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rewards.<a href="/Sources/Resources/Rewards/RewardsClient.swift">create</a>(accountId: String, request: Requests.CreateRewardsRequest, requestOptions: RequestOptions?) -> CreateRewardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new reward for a loyalty card. The card must belong to the same store.
The `card_id` is required on create but cannot be changed afterwards.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.rewards.create(
        accountId: "1",
        request: .init(reward: CreateRewardsRequestReward(
            cardId: 1,
            name: "name",
            stampsRequired: 1
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CreateRewardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rewards.<a href="/Sources/Resources/Rewards/RewardsClient.swift">get</a>(accountId: String, id: String, requestOptions: RequestOptions?) -> GetRewardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single reward by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.rewards.get(
        accountId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Reward ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rewards.<a href="/Sources/Resources/Rewards/RewardsClient.swift">delete</a>(accountId: String, id: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently deletes a reward. This cannot be undone.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.rewards.delete(
        accountId: "1",
        id: "1"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Reward ID
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rewards.<a href="/Sources/Resources/Rewards/RewardsClient.swift">update</a>(accountId: String, id: String, request: Requests.UpdateRewardsRequest, requestOptions: RequestOptions?) -> UpdateRewardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing reward. The `card_id` cannot be changed after creation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.rewards.update(
        accountId: "1",
        id: "1",
        request: .init(reward: UpdateRewardsRequestReward(

        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Store (account) ID
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — Reward ID
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateRewardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Status
<details><summary><code>client.status.<a href="/Sources/Resources/Status/StatusClient.swift">check</a>(requestOptions: RequestOptions?) -> CheckStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the status of the API. No authentication required.

Every response from this API, including this one, carries `RateLimit-Limit`,
`RateLimit-Remaining`, `RateLimit-Reset` and `RateLimit-Policy`. Exceeding
the limit returns 429 with `Retry-After` in seconds.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Leal

private func main() async throws {
    let client = LealClient(token: "<token>")

    _ = try await client.status.check()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

