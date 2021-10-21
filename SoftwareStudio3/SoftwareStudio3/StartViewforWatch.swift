//
//  StartViewforWatch.swift
//  SoftwareStudio3
//
//  Created by Jasmina Dang on 13/10/21.
//

import SwiftUI
import HealthKit

struct StartView: View {
    var workoutTypes: [HKWorkoutActivityType] = [.running, .walking, .pilates]
    var body: some View {
        Text("Hello, World!")
            .padding()
    }
}
