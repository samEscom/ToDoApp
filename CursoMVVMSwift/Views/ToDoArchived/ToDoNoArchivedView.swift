//
//  ToDoNoArchivedView.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 28/01/26.
//

import SwiftUI

struct ToDoNoArchivedView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 8) {
            Text("No hay notas archivadas")
                .font(.title2)
            Button {
                dismiss()
            } label: {
                Text("Ver las notas")
                    .font(.headline)
                    .foregroundStyle(Color(.teal))
            }
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: 200)
    }
}

#Preview {
    ToDoNoArchivedView()
}
