//
//  ViewModel.swift
//  BrunoAPP
//
//  Created by Student11 on 29/03/23.
//

import Foundation

struct RawData : Codable, Hashable {
    let umidade: Double
    let inclinacaoSegmentos: Double
    let inclinacaoDegrees: Double
}

struct SensorData : Codable, Hashable {
    let _id: String
    let _rev: String
    let umidade: String
    let inclinacao: String
    let date: String
    let raw: RawData
}

class ViewModel : ObservableObject {
    @Published var sensorData : [SensorData] = []
    
    func fetch() {
        guard let url = URL(string: "http://192.168.128.200:1880/readslopemonitor") else{
            return
        }
            
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([SensorData].self, from: data)
                
                DispatchQueue.main.async {
                    self?.sensorData = parsed
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
}
