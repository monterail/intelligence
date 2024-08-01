import Foundation
import AppIntents
import intelligence

@available(iOS 16.0, *)
struct RepresentableQuery: EntityQuery {
  func entities(for identifiers: [String]) async throws -> [RepresentableEntity] {
    return IntelligencePlugin.storage.get().map() { entity in
      return RepresentableEntity(
        displayRepresentation: DisplayRepresentation(stringLiteral: "Repr"),
        id: entity.id,
        representation: EntityProperty(title: LocalizedStringResource(stringLiteral: entity.representation))
      )
    }
  }
}

@available(iOS 16.0, *)
extension RepresentableQuery: EnumerableEntityQuery {
  func allEntities() async throws -> [RepresentableEntity] {
    return IntelligencePlugin.storage.get().map() { entity in
      return RepresentableEntity(
        displayRepresentation: DisplayRepresentation(stringLiteral: "Repr"),
        id: entity.id,
        representation: EntityProperty(title: LocalizedStringResource(stringLiteral: entity.representation))
      )
    }
  }
}

