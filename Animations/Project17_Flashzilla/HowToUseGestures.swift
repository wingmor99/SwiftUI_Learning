//
//  HowToUseGestures.swift
//  Animations
//
//  Created by Jinchao Hou on 2/11/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/how-to-use-gestures-in-swiftui
// https://developer.apple.com/documentation/swiftui/gestures/composing_swiftui_gestures

import SwiftUI

struct HowToUseGestures: View {
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }

    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero

    var body: some View {
        let minimumLongPressDuration = 0.5
        let longPressDrag = LongPressGesture(minimumDuration: minimumLongPressDuration)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, transaction in
                switch value {
                    // long press begins
                case .first(true):
                    state = .pressing
                    // long press confirmed, dragging may begin
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                    // dragging ended or the long press cancelled
                default:
                    state = .inactive
                }
            }
            .onEnded {value in
                guard case .second(true, let drag?) = value else {return}
                self.viewState.width += drag.translation.width
                self.viewState.height += drag.translation.height
            }
        return Circle()
            .fill(Color.blue)
            .overlay(dragState.isDragging ? Circle().stroke(Color.white, lineWidth: 2) : nil)
            .frame(width: 100, height: 100, alignment: .center)
            .offset(
                x: viewState.width + dragState.translation.width,
                y: viewState.height + dragState.translation.height
            )
            .animation(nil)
            .shadow(radius: dragState.isActive ? 8 : 0)
            .animation(.linear(duration: minimumLongPressDuration))
            .gesture(longPressDrag)
    }
//
//    @GestureState var dragAmount = CGSize.zero
//    @State private var viewState = CGSize.zero
//
//    var body: some View {
//        Circle()
//            .fill(Color.blue)
//            .offset(viewState)
//            .frame(width: 100, height: 100)
//        .gesture(
//            DragGesture()
//                .onChanged {value in
//                    self.viewState = value.translation
//            }
//            .onEnded{value in
//                withAnimation {
//                    self.viewState = .zero
//                    self.viewState.width += value.translation.width
//                    self.viewState.height += value.translation.height
//                }
//            }
//
//        )
//    }
}


struct HowToUseGestures_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseGestures()
    }
}
