//
//  PieChartView.swift
//  ChartsDemo
//
//  Created by Joseph Langat on 21/08/2023.
//

import SwiftUI
import Charts

struct PieChartView: View {
    let catData = PetData.catExample
    let dogData = PetData.dogExamples
    
    var catTotal: Double {
        catData.reduce(0) { $0 + $1.population}
    }
    
    var dogTotal: Double {
        dogData.reduce(0) { $0 + $1.population}
    }
    
    var data: [(type: String, amount: Double)] {
        [(type: "cat", amount: catTotal),
         (type: "dog", amount: dogTotal)
        ]
    }
    
    var maxPet: String? {
        data.max {$0.amount < $1.amount}?.type
    }
    var body: some View {
        Text("It is only available in Xcode 15, I")
        /*
        Chart(data, id: \.type) { dataItem in
            SectorMark(angle: .value("Type",dataItem.amount),
                       innerRadius: .ratio(0.5),
                       angularInset: 1.5)
                .opacity(dataItem.type == maxPet ? 1: 0.5)
        }
        .frame(height: 300)
         */
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
