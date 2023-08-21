//
//  RuleChartView.swift
//  ChartsDemo
//
//  Created by Joseph Langat on 21/08/2023.
//

import SwiftUI
import Charts

struct RuleChartView: View {
    let data = [
        ChartData(type: "dog", count: 5),
        ChartData(type: "cat", count: 10),
        ChartData(type: "bird", count: 15)
    ]
    var maxChartData: ChartData? {
        data.max{$0.count < $1.count}
    }
    var average: Double {
            let sumOfCounts = data.reduce(0) { $0 + $1.count }
            return Double(sumOfCounts) / Double(data.count)
        }
    var body: some View {
        Chart {
            ForEach(data) { dataPoint in
                BarMark(x: .value("Type", dataPoint.type),
                        y: .value("Poplulation", dataPoint.count))
                .opacity(maxChartData == dataPoint ? 1: 0.5)
                .foregroundStyle(Color.gray.opacity(0.5))
            }
            RuleMark(y: .value("Avarage", average))
                .foregroundStyle(.green)
                .annotation(position: .bottom, alignment: .bottomLeading) {
                    Text("Average: \(average)")
                        .foregroundColor(.green)
                        .bold()
                }
        }
        .aspectRatio(1,contentMode: .fit)
        .padding()
    }
}

struct RuleChartView_Previews: PreviewProvider {
    static var previews: some View {
        RuleChartView()
    }
}
