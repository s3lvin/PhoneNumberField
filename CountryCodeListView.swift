//
//  CountryCodeListView.swift
//  
//
//  Created by Selvin on 13/08/2022.
//

import SwiftUI

public struct CountryCodeListView: View {
    @ObservedObject var viewModel: CountryCodeListViewModel
    @State private var searchText: String = ""
    
    public var body: some View {
        VStack {
            TextField(
                "Enter country name", text: $searchText
            )
            .onChange(of: searchText) { newText in
                viewModel.filterCountries(searchText: newText)
            }
            .disableAutocorrection(true)
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.accentColor, lineWidth: 1)
            )
            .padding()
            
            List(viewModel.countries, id: \.isoCode) { country in
                Button {
                    debugPrint(country.isoCode)
                    viewModel.didSelectCountry(country: country)
                } label: {
                    HStack {
                        Text("+\(country.phoneCode)")
                            .bold()
                            .italic()
                            .font(.system(.body, design: .monospaced))
                        Spacer()
                        Text(country.localizedName)
                        Text(country.flag())
                    }
                }
                .foregroundColor(.primary)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static let datasource = try! CountriesDataSourceLocal(displayNameLocale: "nl")
    static var previews: some View {
        Group {
            CountryCodeListView(viewModel: CountryCodeListViewModel(dataSource: datasource){print($0)})
            
            CountryCodeListView(viewModel: CountryCodeListViewModel(dataSource: datasource){print($0)})
                .preferredColorScheme(.dark)
        }
    }
}
