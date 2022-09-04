//
//  File.swift
//  
//
//  Created by Selvin on 13/08/2022.
//

import Foundation

public enum CountriesDataSourceError: Error {
    case countriesFileCouldNotBeLoaded
    case countriesFileNotFound
}

public protocol CountriesDataSource {
    var countries:[CountryCodeModel] { get }
    var displayNameLocale:String {get set}
}

public class CountriesDataSourceLocal: CountriesDataSource {

    public private(set) var countries:[CountryCodeModel]
    public var displayNameLocale: String
    
    public init(displayNameLocale: String = Locale.current.languageCode!) throws {
        let bundle = Bundle(identifier: "org.s3lvin.cocoapods.PhoneNumberField")
        if let bundle = bundle, let countriesFileURL = bundle.url(forResource: "countries", withExtension: "json") {
            do {
                let data = try Data(contentsOf: countriesFileURL)
                let countriesItems = try JSONDecoder().decode([CountryCodeItem].self, from: data)
                countries = countriesItems.map {
                    CountryCodeModel(countryItem: $0, localeIdentifier: displayNameLocale)
                }
            } catch {
                countries = []
                throw CountriesDataSourceError.countriesFileCouldNotBeLoaded
            }
        } else {
            countries = []
            throw CountriesDataSourceError.countriesFileNotFound
        }
        self.displayNameLocale = displayNameLocale
        processMap()
    }
    
    internal func processMap() {
        countries.sort { a, b in
            a.localizedName < b.localizedName
        }
    }
    
}
