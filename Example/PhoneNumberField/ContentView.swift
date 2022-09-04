//
//  ContentView.swift
//  PhoneNumberField_Example
//
//  Created by Selvin on 03/09/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import PhoneNumberField

struct ContentView: View {
    var body: some View {
        PhoneNumberField("+xx-xxxxxxxxxx", viewModel: PhoneNumberFieldViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
