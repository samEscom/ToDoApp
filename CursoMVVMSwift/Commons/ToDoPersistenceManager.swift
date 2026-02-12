//
//  ToDoPersistenceManager.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 21/01/26.
//


import Foundation
import CoreData

final class ToDoPersistenceManager {
    static let shared = ToDoPersistenceManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "ModelData")
        container.loadPersistentStores{ storeDescription, error in
            if let error = error{
                print("Error, loaded persistent stores: \(error)")
            }else {
                print("loaded persistent stores")
            }
            
        }
    }
}
