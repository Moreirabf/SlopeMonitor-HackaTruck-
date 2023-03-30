//
//  SensorSubView.swift
//  BrunoAPP
//
//  Created by Student on 27/03/23.
//

import SwiftUI

struct SensorSubView: View {
    @State private var name: String = ""
    @State private var location: String =  ""
    @State private var description: String = ""
    @State private var latitude: String =  ""
    @State private var longitude: String =  ""
    @State private var showAlert = false

    var body: some View {
        VStack {
            NavigationView {
                List {
                    // 1
                    Section() {
                        TextField(
                            "Nome do sensor",
                            text: $name
                        )
                        TextField(
                            "Localizacao",
                            text: $location
                        )
                        TextField(
                            "Descricao",
                            text: $description
                        )
                        TextField(
                            "latitude",
                            text: $latitude
                        )
                        TextField(
                            "longitude",
                            text: $longitude
                        )


                        }//section
                    
                    Button("Adicionar") {
                      // button tapped
                        showAlert = true
                    }.alert(isPresented : $showAlert) {
                        Alert(title: Text("Sensor adicionado"))
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                    .buttonStyle(BorderlessButtonStyle())
                    .buttonStyle(DefaultButtonStyle())
                    
                       
                    }
                    .navigationTitle("Adicionar um sensor")// List
                }
               
            }
            
        }
        
    } //VSTACK
       
            
     



struct SensorSubView_Previews: PreviewProvider {
    static var previews: some View {
        SensorSubView()
    }
}
