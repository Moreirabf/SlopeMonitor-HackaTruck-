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
}//buttonstyle

struct OutlinedTextFieldStyle: TextFieldStyle {
    
    @State var icon: Image?
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            if icon != nil {
                icon
                    .foregroundColor(Color(UIColor.systemGray4))
            }
            configuration
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color(UIColor.systemGray4), lineWidth: 2)
        }
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
            HStack{
                Text("Login")
                    .font(Font.custom("Satoshi-Bold", size: 40))
                  
                    
            }
            
            TextField(
                "Username",
                text: $username
            )
         .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "person")))
            .disableAutocorrection(true)
            .textFieldStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Text Field Style@*/DefaultTextFieldStyle()/*@END_MENU_TOKEN@*/)
            
            TextField(
                "Password",
                text: $password
            )
           
            .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
            .disableAutocorrection(true)
            .textFieldStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Text Field Style@*/DefaultTextFieldStyle()/*@END_MENU_TOKEN@*/)
            
            NavigationLink(destination: RecoveryView()){
                Text("Esqueci minha senha")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
            }
            .padding(.leading, 145.0)
            HStack(spacing: 0){
                NavigationLink(destination: ContentView()){
                        Text("Entrar")
                }
                .padding(.top, 16)//Navigation
                .buttonStyle(RoundedRectangleButtonStyle())
                .buttonStyle(BorderlessButtonStyle())
                .buttonStyle(DefaultButtonStyle())
                
            }// HSTACK
           
            
                
                    
            HStack{
                
                    Text("Não possui cadastro?")
                   
                    NavigationLink(destination: SubUserView()){
                        Text("   Crie sua conta")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            
                            
                    }//Navigation
                    
                 
                
                   
            }
            .padding(.top, 55.0)//Hstack
          
            
            
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
