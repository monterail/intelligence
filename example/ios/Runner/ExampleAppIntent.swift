//
//  ExampleAppIntent.swift
//  intelligence
//
//  Created by Marcin Wróblewski on 29/07/2024.
//

import Foundation
import AppIntents

@available(iOS 16, *)
struct OpenRepresentable: AppIntent {
    static let openAppWhenRun = true
    
    static var title: LocalizedStringResource = "Open Representable"
    
    @Parameter(title: "Item")
    var target: RepresentableEntity
    
    func perform() async throws -> some IntentResult {
        let selectedId = target.id
        return .result()
    }
    
    static var parameterSummary: some ParameterSummary {
        Summary("Open \(\.$target)")
    }
}
