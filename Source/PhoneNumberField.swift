//
//  PhoneNumberField.swift
//  
//
//  Created by Selvin on 29/08/2022.
//

import SwiftUI

public struct PhoneNumberField: View {
    @ObservedObject var viewModel: PhoneNumberFieldViewModel
    
    private let countriesDatasource = try! CountriesDataSourceLocal()
    private let placeHolderText: String
    
    public init(_ text:String, viewModel: PhoneNumberFieldViewModel) {
        self.viewModel = viewModel
        self.placeHolderText = text
    }
    
    public var body: some View {
        TextField(placeHolderText, text: $viewModel.number) {
                if $0 {
                    viewModel.onFocus()
                }
            }
            .keyboardType(.phonePad)
            .disableAutocorrection(true)
            .padding()
            .overlay(
                Capsule()
                    .stroke(Color.accentColor, lineWidth: 1)
            )
            .padding()
            .sheet(isPresented: $viewModel.showCountryCodePicker, content: {
                CountryCodeListView(viewModel: CountryCodeListViewModel(dataSource: countriesDatasource) {
                    viewModel.didSelectCountry(country: $0)
                })
            })
    }
}

#if DEBUG

struct PhoneNumberField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberField("+xx-xxxxxxxxxx", viewModel: PhoneNumberFieldViewModel())
    }
}

#endif
