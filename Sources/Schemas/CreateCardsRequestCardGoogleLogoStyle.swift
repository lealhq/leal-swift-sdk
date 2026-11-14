import Foundation

/// How the logo sits on Google Wallet. Defaults to 'round'
public enum CreateCardsRequestCardGoogleLogoStyle: String, Codable, Hashable, CaseIterable, Sendable {
    case round
    case wide
}