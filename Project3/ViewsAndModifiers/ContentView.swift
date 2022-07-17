//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Peyton Gasink on 7/15/22.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

extension View {
    func largeTitleStyle() -> some View {
        modifier(LargeTitle())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is a large blue title")
                .largeTitleStyle()
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
