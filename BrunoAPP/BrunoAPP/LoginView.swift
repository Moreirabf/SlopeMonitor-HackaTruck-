//
//  LoginView.swift
//  BrunoAPP
//
//  Created by Student on 28/03/23.
//

import SwiftUI


struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .padding()
    .background(Color.black
        .cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String =  ""
    var body: some View {
        NavigationStack{   VStack(alignment: .center) {
            
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
                "Username",
                text: $username
            )
            .disableAutocorrection(true)
            TextField(
                "Password",
                text: $password
            )
            .disableAutocorrection(true)
            
            HStack{
                NavigationLink(destination: ContentView()){
                        Text("Entrar")
                        }//Navigation
                .buttonStyle(RoundedRectangleButtonStyle())
                .buttonStyle(BorderlessButtonStyle())
                .buttonStyle(DefaultButtonStyle())
                
            }// HSTACK
            
            HStack {
            NavigationLink(destination: SubUserView()){
                    Text("Registre-se")
                    }//Navigation
                NavigationLink(destination: RecoveryView()){
                    Text("Esqueci minha senha")
                }
                .padding(.leading, 30.0)
            }
           //Hstack
            
            
            
        }//Vstack
        .frame(width: 299.0, height: 100.0)
        .textFieldStyle(.roundedBorder)
            
        }//Navigation Stack
    }//body
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
