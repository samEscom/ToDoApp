//
//  ToDoStatusView.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 28/01/26.
//

import SwiftUI

public struct ToDoStatusView: View {
    
    public let disabled: Bool
    @EnvironmentObject private var viewModel: ToDoViewModel
    public let todo: TodoEntity
    
    public init(
        todo: TodoEntity,
        disabled: Bool = false) {
            
            self.todo = todo
            self.disabled = disabled
    }
    
    public var body: some View {
        let imageName: String = todo.isCompleted ? "checkmark.circle.fill" : "circle"
        
        let width: CGFloat = todo.isCompleted ? 22 : 24
        let height: CGFloat = width
        
        return Image(systemName: imageName)
            .resizable()
            .frame(width: width)
            .frame(height: height)
            .onTapGesture {
                viewModel.updateToDoStatus(item: todo)
            }
            .disabled(disabled)
    }
    
}
