//
//  NotificationModel.swift
//  BrunoAPP
//
//  Created by Student11 on 30/03/23.
//


import Foundation

struct Notification : Codable, Hashable{
    let _id: String
    let _rev: String
    let notificacao : Int
    let date : String
}

class NotificationModel : ObservableObject {
    @Published var notifications : [Notification] = []
    
    func fetch() {
        guard let url = URL(string: "http://192.168.128.200:1880/readslopenotification") else{
            return
        }
            
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Notification].self, from: data)
                
                DispatchQueue.main.async {
                    self?.notifications = parsed
                }
                
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func formatDate(date : String) -> Date {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return dateFormatter.date(from: date)!
    }
    
    func type(type : Int) -> String {
        if (type == 1) {
            return "Anomalia"
        }
        if (type == 2) {
            return "DESLIZAMENTO"
        }
        if (type == 3) {
            return "Alto risco"
        }
        return ""
    }
}
