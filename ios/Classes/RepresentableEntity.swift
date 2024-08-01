import Foundation
import AppIntents

@available(iOS 16.0, *)
struct RepresentableEntity: AppEntity {
  static var defaultQuery: RepresentableQuery = RepresentableQuery()
  
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Items")
  
  var displayRepresentation: DisplayRepresentation
  
  let id: String
  
  @Property(title: "Name")
  var representation: String
}
