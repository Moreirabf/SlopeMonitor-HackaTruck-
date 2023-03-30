//
//  RecoveryView.swift
//  BrunoAPP
//
//  Created by Student on 28/03/23.
//

import SwiftUI

struct RecoveryView: View {
    @State private var Email: String =  ""
    @State private var showAlert = false
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
            ) .textFieldStyle(OutlinedTextFieldStyle())
                .disableAutocorrection(true)
                .textFieldStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Text Field Style@*/DefaultTextFieldStyle()/*@END_MENU_TOKEN@*/)
            .padding(.horizontal, 30.0)
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            HStack{
                Button("Recuperar") {
                  // button tapped
                    showAlert = true
                }
                .alert(isPresented: $showAlert)
                {
                    Alert( title: Text("E-mail enviado"), message: Text("Por favor verifique seu e-mail"))
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .buttonStyle(BorderlessButtonStyle())
                .buttonStyle(DefaultButtonStyle())
                
            }.padding(.horizontal, 100.0)// HSTACK
                .padding(.top, 40.0)
            
        }//VSTACK
    }//BODY
}

struct RecoveryView_Previews: PreviewProvider {
    static var previews: some View {
        RecoveryView()
    }
}
