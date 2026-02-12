//
//  ToDoAddView.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 18/11/25.
//

import SwiftUI

public struct ToDoAddView: View {
    public var todo: TodoEntity? = nil
    @EnvironmentObject var viewModel: ToDoViewModel
    @Binding var showed: Bool
    
    @State private var title: String = ""
    @State private var note: String = ""
    @State private var date = Date()
    
    
    
        
    private let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startDate = Date.now
        let endDate = calendar.date(byAdding: .year, value: 10, to: startDate) ?? startDate
        
        return startDate...endDate
        
    }()
    
    var isSaveDisabled: Bool {
        !viewModel.validateInput(ofText: title)
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            ToDoTextInput(
                "Ingrese nombre tarea",
                text: $title,
                label: "Tarea"
            )
            ToDoTextInput(
                "Opcional, escribe una descripcion de la tarea",
                text: $note,
                label: "Nota"
            )
            
            DatePicker(selection: $date, in: dateRange){
                Text("Selecciona una fecha").font(.title3)
            }.tint(Color.primary)
                .padding(.vertical, 8)
            
            
            Spacer()
            
            Button {
                if let todo = todo {
                    viewModel.updateToDo(item: todo, newTitle: title, newNote: note, newDate: date)
                } else {
                    viewModel.addToDo(
                        withTitle: title, note: note, date: date)
                }
                showed.toggle()
            } label: {
                Text("Guardar".uppercased())
                    .font(.headline)
                    .tint(Color.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        isSaveDisabled ? Color(UIColor.systemGray5) : Color.teal
                    )
                    .clipShape(.rect(cornerRadius: 10))
            }
            .disabled(isSaveDisabled)
            
        }
        .onAppear {
           if let todo {
               title = todo.title
               note = todo.note ?? ""
               date = todo.date
            }
        }
    }
    
}

#Preview {
    NavigationView {
        //ToDoAddView(
        //    showed: .constant(true)
        //)
    }
}
