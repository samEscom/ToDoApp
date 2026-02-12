//
//  ToDoItemView.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 25/01/26.
//

import SwiftUI

public struct ToDoItemView: View {
    @EnvironmentObject private var viewModel: ToDoViewModel
    public let toDo: TodoEntity
    
    public var body: some View {
        
        if !toDo.id.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment:.top, spacing: 4) {
                    Text(toDo.date, format: .dateTime.day())
                        .font(.system(size: 44, weight: .semibold))
                        .padding(.top, -8)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(toDo.date, format: .dateTime.month())
                            .fontWeight(.semibold)
                        Text(toDo.date, format: .dateTime.weekday(.abbreviated))
                            .fontWeight(.semibold)
                    }
                    .padding(.top, -2)
                    Spacer(minLength: 2)
                    ToDoStatusView(todo: toDo)
                    
                }
                VStack(alignment: .leading) {
                    Text(toDo.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    if let description = toDo.note {
                        Text(description)
                            .font(.caption)
                            .fontWeight(.light)
                            .lineLimit(3)
                    }
                    
                }
                Spacer(minLength: 8)
                HStack(spacing: 4){
                    Text("Hora:")
                    Text(toDo.date, format: .dateTime.hour().minute())
                        .fontWeight(.thin)
                }
            }
            .padding()
            .background(Color.indigo)
            .clipShape(.rect(cornerRadius: 10))
            
        } else {
            EmptyView()
        }
    }
}
