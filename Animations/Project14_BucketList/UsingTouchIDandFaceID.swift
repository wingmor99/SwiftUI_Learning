//
//  UsingTouchIDandFaceID.swift
//  Animations
//
//  Created by Jinchao Hou on 2/8/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import LocalAuthentication
import SwiftUI

struct UsingTouchIDandFaceID: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Locked")
            } else {
                Text("Unlocked")
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in DispatchQueue.main.async {
                if success {
                    // authenticated successfully
                    self.isUnlocked = true
                }else {
                    // there was a problem
                }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct UsingTouchIDandFaceID_Previews: PreviewProvider {
    static var previews: some View {
        UsingTouchIDandFaceID()
    }
}
