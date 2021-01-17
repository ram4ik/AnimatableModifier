//
//  ContentView.swift
//  AnimatableModifier
//
//  Created by Ramill Ibragimov on 17.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var percent: CGFloat = 0
    
    var body: some View {
        Circle()
            .fill(Color(.systemGray6))
            .frame(width: 150, height: 150)
            .modifier(AnimatingNumberOverlay(number: percent))
        
        Button(action: {
            percent = 0
            withAnimation(Animation.easeInOut(duration: 1)) {
                percent = 100
            }
        }, label: {
            Text("Animate")
        })
        .accentColor(.primary)
    }
}

struct AnimatingNumberOverlay: AnimatableModifier {
    var number: CGFloat
    var animatableData: CGFloat {
        get {
            number
        }
        set {
            number = newValue
        }
    }
    
    func body(content: Content) -> some View {
        return content
            .overlay(Text("\(Int(number))"))
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
