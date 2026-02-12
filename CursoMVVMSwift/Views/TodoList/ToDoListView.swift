//
//  ToDoListView.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 18/11/25.
//

import SwiftUI

public struct ToDoListView: View {
    @EnvironmentObject var viewModel: ToDoViewModel
    @State private var showedSheet = false
    @State private var todoToPreview: TodoEntity?
    
    private var unArchivedToDos: [TodoEntity] {
        viewModel.toDos.filter{ !$0.isArchived }
    }
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    public var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                if !unArchivedToDos.isEmpty {
                    LazyVGrid(
                        columns: columns,
                        spacing: 8
                    ){
                        ForEach(unArchivedToDos) { todo in
                            ToDoItemView(toDo: todo)
                                .onTapGesture {
                                    todoToPreview = todo
                                    
                                }
                        }
                    }.padding(.horizontal)
                } else {
                    NoToDoView(showedTodoCreationSheet: $showedSheet)
                        .offset(y: UIScreen.main.bounds.height / 2 - 100)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if showedSheet {
                    ToDoSheet(isShow: $showedSheet) {
                        ToDoAddView(showed: $showedSheet)
                    }
                    .ignoresSafeArea(.keyboard)
                } else if todoToPreview != nil {
                    ToDoPreviewView(toDo: $todoToPreview)
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }
            }
        }
        .navigationTitle("ToDos")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 0) {
                    NavigationLink {
                        ToDoArchivedListView()
                    } label: {
                        Image(systemName: "trash")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color.primary)
                    }
                    Button {
                        showedSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.primary)
                    }
                }
            }
        }
        .navigationBarHidden(showedSheet || (todoToPreview != nil))
    }
    
}

#Preview {
    NavigationView {
        //ToDoListView()
    }
}
