import Foundation

/// How the logo sits on Google Wallet. Defaults to 'round'
public enum UpdateCardsRequestCardGoogleLogoStyle: String, Codable, Hashable, CaseIterable, Sendable {
    case round
    case wide
}