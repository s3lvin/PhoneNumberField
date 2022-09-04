//
//  CountryCodeListViewModel.swift
//  
//
//  Created by Selvin on 14/08/2022.
//

import Foundation
import SwiftUI

public final class CountryCodeListViewModel: ObservableObject {
    
    public let dataSource: CountriesDataSource
    @Published var countries: [CountryCodeModel]
    private let didSelectCountry:(CountryCodeModel)->Void
    
    public init(dataSource: CountriesDataSource, didSelectCountry:@escaping (_ country: CountryCodeModel)->Void) {
        self.dataSource = dataSource
        self.countries = dataSource.countries
        self.didSelectCountry = didSelectCountry
    }
    
    public func filterCountries(searchText: String) {
        self.countries = dataSource.countries.filter { countryCodeModel in
            countryCodeModel.localizedName.hasPrefix(searchText)
        }
    }
    
    public func didSelectCountry(country: CountryCodeModel) {
        self.didSelectCountry(country)
        print(country.phoneCode)
    }
    
}
