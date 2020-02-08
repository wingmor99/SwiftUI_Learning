//
//  switchViewStates.swift
//  Animations
//
//  Created by Jinchao Hou on 2/7/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct switchViewStates: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    var loadState = LoadingState.loading
    
    var body: some View {
        Group {
            if loadState == .loading {
                LoadingView()
            } else if loadState == .success {
                SuccessView()
            } else if loadState == .failed {
                FailedView()
            }
        }
    }
}

struct switchViewStates_Previews: PreviewProvider {
    static var previews: some View {
        switchViewStates()
    }
}
