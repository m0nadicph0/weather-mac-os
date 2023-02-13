import Foundation

extension String {
    func toCountry() -> String {
        return Locale(identifier: "en_US").localizedString(forRegionCode: self) ?? self
    }
}
