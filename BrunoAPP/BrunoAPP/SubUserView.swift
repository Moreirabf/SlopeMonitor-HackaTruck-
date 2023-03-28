//
//  SubUserView.swift
//  BrunoAPP
//
//  Created by Student on 28/03/23.
//

import SwiftUI

struct SubUserView: View {
    @State private var Nome: String = ""
    @State private var Sobrenome: String =  ""
    @State private var Telefone: String = ""
    @State private var Email: String =  ""
    @State private var ConfirmEmail: String = ""
    @State private var Senha: String =  ""
    @State private var Insituicao: String =  ""
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
            
            
            
                HStack{
                    TextField(
                    "Nome",
                    text: $Nome
                )
                .disableAutocorrection(true)
                    TextField(
                        "Sobrenome",
                        text: $Sobrenome
                    )
                    .disableAutocorrection(true)
                }
                .padding(.horizontal)//Hstack
                .textFieldStyle(.roundedBorder)
                
                VStack {
                    TextField(
                        "Digite seu e-mail",
                        text: $Email
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Confirme seu e-mail",
                        text: $ConfirmEmail
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Digite seu telefone",
                        text: $Telefone
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Senha",
                        text: $Senha
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "instituição de ensino",
                        text: $Insituicao
                    )
                    .disableAutocorrection(true)
                    
                    
                }
                .padding(.horizontal)
            //VSTACK
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
            }//Vstack
            
        
    }//body
}

struct SubUserView_Previews: PreviewProvider {
    static var previews: some View {
        SubUserView()
    }
}
