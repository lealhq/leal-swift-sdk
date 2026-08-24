import Foundation

/// Validation messages, either a list of strings or an object keyed by field name.
public enum ErrorErrors: Codable, Hashable, Sendable {
    case stringArray([String])
    case stringToStringArrayDictionary([String: [String]])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode([String].self) {
            self = .stringArray(value)
        } else if let value = try? container.decode([String: [String]].self) {
            self = .stringToStringArrayDictionary(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .stringArray(let value):
            try container.encode(value)
        case .stringToStringArrayDictionary(let value):
            try container.encode(value)
        }
    }
}