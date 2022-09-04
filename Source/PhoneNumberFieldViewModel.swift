//
//  File.swift
//  
//
//  Created by Selvin on 03/09/2022.
//

import Foundation
import SwiftUI

public final class PhoneNumberFieldViewModel: ObservableObject {
    
    @Published var number: String = "" {
        didSet {
            if number.isEmpty {
                showCountryCodePicker = true
            }
        }
    }
    @Published var showCountryCodePicker: Bool = false
    
    public init() {}
    
    public func onFocus() {
        if number.isEmpty {
            showCountryCodePicker = true
        }
    }
    
    public func didSelectCountry(country: CountryCodeModel) {
        number = "+\(country.phoneCode)"
        showCountryCodePicker = false
    }
}
