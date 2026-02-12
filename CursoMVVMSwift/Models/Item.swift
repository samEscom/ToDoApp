//
//  Item.swift
//  CursoMVVMSwift
//
//  Created by Samuel Chavez on 15/11/25.
//

import Foundation

public struct Item: Identifiable, Equatable {
    public let id: String = UUID().uuidString
    public var title: String
    public var note: String?
    public var date: Date
    public var isCompleted: Bool = false
    public var isArchived: Bool = false
}
