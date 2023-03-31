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
import MapKit



struct NotificationView: View {
    let timer = Timer.publish(every: 2, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @StateObject var notificationModel = NotificationModel()
    
    @State var sensor = Sensor(name: "São Carlos", locationName: "Lugar 1", description: "primeiro sensor", coordinate: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388))
    
    var body: some View {
        NavigationStack{
            VStack{
            
                List{
                    ForEach(notificationModel.notifications, id: \.self){ n in
                        NavigationLink{
                            SensorView(sensor: sensor)
                        } label: {
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
                }.navigationTitle("Notificações")
                
            }.onReceive(timer) { time in
                notificationModel.fetch()
            }
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        
        NotificationView()
    }
}
