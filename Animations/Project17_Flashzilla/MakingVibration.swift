//
//  MakingVibration.swift
//  Animations
//
//  Created by Jinchao Hou on 2/12/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//
// https://www.hackingwithswift.com/books/ios-swiftui/making-vibrations-with-uinotificationfeedbackgenerator-and-core-haptics

import SwiftUI
import CoreHaptics

struct MakingVibration: View {
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        VStack {
            Text("Error vibration")
            .onTapGesture(perform: simpleSuccess)
            .padding()
            Text("CHHapticEngine")
            .onAppear(perform: preparedHaptics)
            .onTapGesture(perform: complexSuccess)
            .padding()
        }
    }
    
    // simple vibtation
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    func preparedHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return}
        
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        }catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return }
        var events = [CHHapticEvent]()
        
        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        // convert those events into a pattern and play it immediately
        do{
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Faild to play pattern: \(error.localizedDescription)")
        }
    }
}

struct MakingVibration_Previews: PreviewProvider {
    static var previews: some View {
        MakingVibration()
    }
}
