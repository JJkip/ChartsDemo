//
//  PetStatisticsView.swift
//  ChartsDemo
//
//  Created by Joseph Langat on 19/08/2023.
//

import SwiftUI
import Charts

struct PetStatisticsView: View {
    let catData = PetData.catExample
    let dogData = PetData.dogExamples
    
    var body: some View {
        Chart {
            ForEach(catData) { data in
                BarMark(x: .value("Year", data.year),
                        y: .value("Population", data.population)
                )
            }
            .foregroundStyle(.purple)
            ForEach(catData) { data in
                BarMark(x: .value("Year", data.year),
                        y: .value("Population", data.population)
                )
            }
            .foregroundStyle(.indigo)
        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1,contentMode: .fit)
    }
}

struct LineChartView: View {
    let catData = PetData.catExample
    let dogData = PetData.dogExamples
    var data: [(type: String, petData:[PetData])] {
        [(type:"cat", petData: catData),
         (type:"dog", petData: dogData)]
    }
    var body: some View {
        Chart(data,id: \.type) { dataSeries in
            ForEach(dataSeries.petData) { data in
                LineMark(x: .value("Year", data.year),
                        y: .value("Population", data.population)
                )
            }
            .foregroundStyle(by: .value("Pet type", dataSeries.type))
            .symbol(by: .value("Pet type",dataSeries.type))
        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1,contentMode: .fit)
        .padding()
    }
}

struct PetStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}
