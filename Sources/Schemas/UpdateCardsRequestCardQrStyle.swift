import Foundation

/// What the wallet pass QR holds. Changing it refreshes installed passes; passes still showing the old QR keep scanning
public enum UpdateCardsRequestCardQrStyle: String, Codable, Hashable, CaseIterable, Sendable {
    case link
    case code
}