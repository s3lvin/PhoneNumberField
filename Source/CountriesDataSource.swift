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
    
        guard let resourceBundleURL = Bundle(identifier: "org.cocoapods.PhoneNumberField")?.url(forResource: "PhoneNumberField", withExtension: "bundle"), let resourceBundle =  Bundle(url: resourceBundleURL) else {
            throw CountriesDataSourceError.countriesFileNotFound }
       
        if let countriesFileURL = resourceBundle.url(forResource: "countries", withExtension: "json") {
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
