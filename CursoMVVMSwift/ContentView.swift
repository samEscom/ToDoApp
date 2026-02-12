//
//  ContentView.swift
//  CursoMVVMSwift
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ToDoListView()
        }
        .tint(Color.primary)
    }
}

#Preview {
    ContentView()
}
