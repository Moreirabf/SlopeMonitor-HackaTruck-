//
//  RecoveryView.swift
//  BrunoAPP
//
//  Created by Student on 28/03/23.
//

import SwiftUI

struct RecoveryView: View {
    @State private var Email: String =  ""
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/4135/4135908.png")){
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.white
            }
            .padding(.bottom, 150.0)
            
            .frame(width: 100, height: 100)
            
            TextField(
                "Digite seu e-mail",
                text: $Email
            )
            .padding(.horizontal, 50.0)
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            HStack{
                Button("Registrar") {
                  // button tapped
                
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .buttonStyle(BorderlessButtonStyle())
                .buttonStyle(DefaultButtonStyle())
                
            }.padding(.horizontal, 100.0)// HSTACK
                .padding(.top, 20.0)
            
        }//VSTACK
    }//BODY
}

struct RecoveryView_Previews: PreviewProvider {
    static var previews: some View {
        RecoveryView()
    }
}
