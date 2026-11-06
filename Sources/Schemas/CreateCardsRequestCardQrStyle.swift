import Foundation

/// What the wallet pass QR holds. Defaults to 'link' for new cards
public enum CreateCardsRequestCardQrStyle: String, Codable, Hashable, CaseIterable, Sendable {
    case link
    case code
}