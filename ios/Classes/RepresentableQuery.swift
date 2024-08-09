import Foundation
import AppIntents
import intelligence

@available(iOS 16.0, *)
struct RepresentableQuery: EntityQuery {
  func entities(for identifiers: [String]) async throws -> [RepresentableEntity] {
    return IntelligencePlugin.storage.get(for: identifiers).map() { item in
      return RepresentableEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
  
  func suggestedEntities() async throws -> [RepresentableEntity] {
    return IntelligencePlugin.storage.get().map() { item in
      return RepresentableEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
}

@available(iOS 16.0, *)
extension RepresentableQuery: EnumerableEntityQuery {
  func allEntities() async throws -> [RepresentableEntity] {
    return IntelligencePlugin.storage.get().map() { item in
      return RepresentableEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
}

