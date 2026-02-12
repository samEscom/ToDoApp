//
//  ToDoViewModel.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 21/01/26.
//


import Foundation
import CoreData
import Combine


public final class ToDoViewModel: ObservableObject {
    @Published private(set) var toDos: [TodoEntity] = []
    
    var cancellables = Set<AnyCancellable>()
    
    private var storeContainer: NSPersistentContainer {
        return ToDoPersistenceManager.shared.container
    }
    
    init() {
        fetchToDos()
    }
    
    
    private func fetchToDos() {
        do {
            let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
            
            let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            request.sortDescriptors = [sortDescriptor]
            request.returnsObjectsAsFaults = false
            
            toDos = try storeContainer.viewContext.fetch(request)
            
        } catch {
            print("Error loading tasks")
        }
    }
    
    private func saveData(){
        
         do {
             try storeContainer.viewContext.save()
             fetchToDos()
         } catch {
             print("Error saving data")
         }
    }
    
    private func getToDoIndex(item todo: TodoEntity) -> Int? {
        guard
            let index = toDos.firstIndex(where: { $0.id == todo.id})
                else { return nil }
        return index
    }
    
    public func validateInput(ofText text: String) -> Bool {
        guard
            text.trimmingCharacters(in: .whitespaces).count > 2
        else {
            return false
        }
        
        return true
    }
    
    public func addToDo(withTitle title: String, note: String, date: Date) {
        let newToDo = TodoEntity(context: storeContainer.viewContext)
        newToDo.id = UUID().uuidString
        newToDo.title = title
        newToDo.note = note
        newToDo.date = date
        newToDo.isArchived = false
        newToDo.isCompleted = false
        
        saveData()
    }
    
    public func updateToDo(
        item todo: TodoEntity,
        newTitle title: String,
        newNote note: String,
        newDate date: Date
    ){
        guard let index = getToDoIndex(item: todo) else { return }
        
        toDos[index].title = title
        toDos[index].note = note
        toDos[index].date = date
        
        saveData()
    }
    
    public func deleteToDo(item todo: TodoEntity){
        guard let index = getToDoIndex(item: todo) else { return }
        
        let elementToRemove = toDos[index]
        
        storeContainer.viewContext.delete(elementToRemove)
        saveData()
        
    }
    
    public func archiveToDo(item todo: TodoEntity){
        guard let index = getToDoIndex(item: todo) else { return }
        
        toDos[index].isArchived = true
        
        saveData()
        
    }
    
    public func unArchiveToDo(item todo: TodoEntity){
        guard let index = getToDoIndex(item: todo) else { return }
        
        toDos[index].isArchived = false
        
        saveData()
    }
    
    public func updateToDoStatus(item todo: TodoEntity){
        guard let index = getToDoIndex(item: todo) else { return }
        
        toDos[index].isCompleted.toggle()
        
        saveData()
    }
}
