//
//  TestView.swift
//  BrunoAPP
//
//  Created by Student11 on 29/03/23.
//

import SwiftUI

struct TestView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.sensorData, id: \.self) { c in
                //print(viewModel.formatDate(date: c.date))
                //Text(viewModel.formatDate(date: c.date))
                Text(viewModel.formatDate(date: c.date), style: .time)
            }.onAppear(){
                viewModel.fetch()
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
