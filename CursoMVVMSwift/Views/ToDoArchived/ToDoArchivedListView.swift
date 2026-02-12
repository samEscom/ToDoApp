//
//  ToDoArchivedListView.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 28/01/26.
//

import SwiftUI

public struct ToDoArchivedListView: View {
    @EnvironmentObject var viewModel: ToDoViewModel
    
    private var archivedTodos: [TodoEntity] {
        viewModel.toDos.filter{$0.isArchived}
    }
    
    public var body: some View {
            ScrollView {
                if !archivedTodos.isEmpty {
                    ForEach(archivedTodos) { todo in
                        ZStack {
                            ToDoArchivedItemView(todo:  todo)
                        }.padding(.horizontal)
                        
                    }
                } else {
                    ToDoNoArchivedView()
                        .offset(y: UIScreen.main.bounds.height * 0.35)
                }
            }
            .padding(.top, 16)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Archivadas")
        }
}
