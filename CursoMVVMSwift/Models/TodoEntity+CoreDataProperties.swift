//
//  TodoEntity+CoreDataProperties.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 15/11/25.
//
//

public import Foundation
public import CoreData


public typealias TodoEntityCoreDataPropertiesSet = NSSet

extension TodoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoEntity> {
        return NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
    }

    @NSManaged public var title: String
    @NSManaged public var date: Date
    @NSManaged public var isArchived: Bool
    @NSManaged public var isCompleted: Bool
    @NSManaged public var note: String?
    @NSManaged public var id: String

}

extension TodoEntity : Identifiable {

}
