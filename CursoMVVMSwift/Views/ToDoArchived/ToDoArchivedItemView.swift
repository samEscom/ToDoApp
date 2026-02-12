//
//  ToDoArchivedView.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 18/11/25.
//

import SwiftUI

public struct ToDoArchivedItemView: View {
    @EnvironmentObject private var viewModel: ToDoViewModel
    public var todo: TodoEntity
    
    public var body: some View {
        if !todo.id.isEmpty {
            HStack {
                VStack(alignment: .leading) {
                    Text(todo.title)
                        .font(.headline)
                        .lineLimit(1)
                        .padding(.top, -4)
                }
                Text(todo.date, format: .dateTime.day().month().year())
                Spacer()
                HStack(spacing: 8) {
                ToDoStatusView(todo: todo)
                Button {
                    viewModel.deleteToDo(item: todo)
                } label: {
                    Image(systemName: "trash")
                        .font(.system(size: 20, weight: .semibold))
                        .tint(Color(UIColor.systemPink))
                    }
                Button {
                    viewModel.unArchiveToDo(item: todo)
                } label: {
                    Image(systemName: "plus")
                                .font(.system(size: 20, weight: .semibold))
                                .tint(Color.primary)
                    }
                }
        }
            .padding()
            .background(Color.gray)
            .clipShape(.rect(cornerRadius: 10))
        } else {
            EmptyView()
        }
        
    }
    
}

#Preview {
    ToDoArchivedListView()
        
}
