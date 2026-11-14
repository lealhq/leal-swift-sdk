import Foundation

/// Apple Wallet layout. 'poster' is iOS 27's full-bleed layout; older iPhones show the store card. Defaults to 'store_card'
public enum CreateCardsRequestCardApplePassStyle: String, Codable, Hashable, CaseIterable, Sendable {
    case storeCard = "store_card"
    case poster
}