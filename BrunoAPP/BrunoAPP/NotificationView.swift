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
    @StateObject var notificationModel = NotificationModel()
    @State var notifications : [Notification]
    
    var body: some View {
        VStack{
            NavigationStack{
                List{
                    ForEach(notifications, id: \.self){ n in
                        HStack{
                            VStack(alignment: .leading){
                                Text(notificationModel.type(type: n.notificacao)).bold()
                                Text("Sensor: São Carlos")
                            }.padding(5)
                            Spacer()
                            VStack{
                                Text(n.date)
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
        let n = [Notification(_id: "", _rev: "", notificacao: 1, date: "2023-03-30T20:27:06.272Z"),
                 Notification(_id: "", _rev: "",notificacao: 2, date: "2023-03-30T20:27:06.272Z"),
                 Notification(_id: "", _rev: "",notificacao: 3, date: "2023-03-30T20:27:06.272Z")
        ]
        NotificationView(notifications: n)
    }
}
