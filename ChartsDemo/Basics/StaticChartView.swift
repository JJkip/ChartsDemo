//
//  StaticChartView.swift
//  ChartsDemo
//
//  Created by Joseph Langat on 17/08/2023.
//

import SwiftUI
import Charts

struct StaticChartView: View {
    @State private var averageIsShown = false
    
    var body: some View {
        VStack {
            Chart {
                BarMark(x: .value("Type", "bird"), y: .value("Population",5))
                    .foregroundStyle(.indigo)
                    .opacity(0.4)
                BarMark(x: .value("Type", "dog"), y: .value("Population",10))
                    .foregroundStyle(.purple)
                    .opacity(0.5)
                BarMark(x: .value("Type", "cat"), y: .value("Population",15))
                    .foregroundStyle(.pink)
                if averageIsShown {
                    RuleMark(y: .value("Avarage",7.5))
                        .foregroundStyle(.green)
                        .annotation(position: .bottom, alignment: .bottomLeading) {
                            Text("Average 7.5")
                                .foregroundColor(.green)
                        }
                }
            }
//            .chartYScale(range: .plotDimension(padding: 60))
            .aspectRatio(1,contentMode: .fit)
//            .padding()
            //        .chartXScale(domain: 25...255)
            //        .chartLegend(.hidden)
            //        .chartXAxis(.hidden)
            //        .chartYAxis{
            //            AxisMarks {_ in
            //                AxisValueLabel()
            //            }
            //        }
            Toggle(averageIsShown ? "Show Avarage" : "Hide Average", isOn: $averageIsShown.animation())
            
        }
        .padding()
    }
}

struct StaticChartView_Previews: PreviewProvider {
    static var previews: some View {
        StaticChartView()
    }
}
