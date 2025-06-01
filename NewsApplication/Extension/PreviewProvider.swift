//
//  Develop.swift
//  NewsApplication
//
//  Created by Dostan Turlybek on 01.06.2025.
//
import SwiftUI
import Foundation

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()
    
}
    

