//
//  HeaderView.swift
//  FetchNews
//
//  Created by Harsh Duggal on 05/05/24.
//

import SwiftUI
// MARK: Header View
struct HeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.red)
            Text(" Welcome to the daily dose of \n News around the globe!")
        }
    }
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
