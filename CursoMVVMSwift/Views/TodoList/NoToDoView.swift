//
//  NoToDoView.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 28/01/26.
//


import SwiftUI

struct NoToDoView: View {
    
    @Binding var showedTodoCreationSheet: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Aun no hay tareas")
                .font(.title2)
            Button{
                showedTodoCreationSheet.toggle()
            } label: {
                Text("Agregar tarea").font(.headline).foregroundStyle(Color.teal)
            }
        }
    }
}
