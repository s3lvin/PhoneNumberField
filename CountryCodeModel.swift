//
//  CountryCodeModel.swift
//  
//
//  Created by Selvin on 13/08/2022.
//

import Foundation

public struct CountryCodeItem: Codable {
    let phoneCode: String
    let isoCode: String
}

public struct CountryCodeModel {
    let phoneCode: String
    let isoCode: String
    let localizedName: String
    
    public init(countryItem: CountryCodeItem, localeIdentifier: String) {
        self.phoneCode = countryItem.phoneCode
        self.isoCode = countryItem.isoCode
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: isoCode])
        self.localizedName = NSLocale(localeIdentifier: localeIdentifier)
            .displayName(forKey: NSLocale.Key.identifier, value: id) ?? isoCode
    }
}

public extension CountryCodeModel {
    /// Returns flag of the country as unicode string
    func flag() -> String {
        isoCode
            .unicodeScalars
            .map { 127_397 + $0.value }
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
}
