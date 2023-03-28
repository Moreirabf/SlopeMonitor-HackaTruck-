//
//  NotificationView.swift
//  BrunoAPP
//
//  Created by Student on 17/03/23.
//
/**
 Esta view vai ser uma lista de sensores que apitaram e dizer pq
 
 */

//Colocar marcadores de que notificacao nao foi lida


import SwiftUI




struct NotificationView: View {
    @State var notifications = [
        Notification(type: "Risco de queda!!!", sensor: "1",date: "27/03/2023"),
        Notification(type: "Risco de queda!!!", sensor: "2",date: "27/03/2023"),
        Notification(type: "DESLIZAMENTO", sensor: "3",date: "27/03/2023"),
        Notification(type: "DESLIZAMENTO", sensor: "4",date: "27/03/2023"),
        Notification(type: "DESLIZAMENTO", sensor: "5",date: "27/03/2023"),
    ]
    
    var body: some View {
        VStack{
            NavigationStack{
                List{
                    ForEach(notifications, id: \.self){ notification in
                        HStack{
                            VStack(alignment: .leading){
                                Text(notification.type).bold()
                                Text("Sensor: " + notification.sensor)
                            }.padding(5)
                            Spacer()
                            VStack{
                                Text(notification.date)
                            }
                        }
                        
                        
                    }
                }
                .navigationTitle("Notificações")
            }
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
