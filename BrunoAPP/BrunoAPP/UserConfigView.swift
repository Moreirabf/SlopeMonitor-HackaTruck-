//
//  UserConfigView.swift
//  BrunoAPP
//
//  Created by Student on 27/03/23.
//

import SwiftUI

struct UserConfigView: View {
    var body: some View {
        NavigationView {
            List {
                // 1
                Section() {
                    VStack(alignment: .leading) {
                        Text("Name")
                            .font(.subheadline)
                        Text("Thales Darini")
                            .font(.headline)
                    }
                    VStack(alignment: .leading) {
                        Text("Phone number")
                            .font(.subheadline)
                        Text("(16) 98394-1345")
                            .font(.headline)
                    }
                    VStack(alignment: .leading) {
                        Text("E-mail")
                            .font(.subheadline)
                        Text("hacka@truck.com")
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("My Account")
        }
    }
}

struct UserConfigView_Previews: PreviewProvider {
    static var previews: some View {
        UserConfigView()
    }
}
