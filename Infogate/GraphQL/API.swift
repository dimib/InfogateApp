//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LocationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Location($query: String, $max: Int) {
      locations(service: "HVV", query: $query, max: $max) {
        __typename
        id
        type
        name
        city
        position {
          __typename
          latitude
          longitude
        }
      }
    }
    """

  public let operationName = "Location"

  public var query: String?
  public var max: Int?

  public init(query: String? = nil, max: Int? = nil) {
    self.query = query
    self.max = max
  }

  public var variables: GraphQLMap? {
    return ["query": query, "max": max]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["InfogateQuery"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("locations", arguments: ["service": "HVV", "query": GraphQLVariable("query"), "max": GraphQLVariable("max")], type: .list(.object(Location.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(locations: [Location?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "InfogateQuery", "locations": locations.flatMap { (value: [Location?]) -> [ResultMap?] in value.map { (value: Location?) -> ResultMap? in value.flatMap { (value: Location) -> ResultMap in value.resultMap } } }])
    }

    public var locations: [Location?]? {
      get {
        return (resultMap["locations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Location?] in value.map { (value: ResultMap?) -> Location? in value.flatMap { (value: ResultMap) -> Location in Location(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Location?]) -> [ResultMap?] in value.map { (value: Location?) -> ResultMap? in value.flatMap { (value: Location) -> ResultMap in value.resultMap } } }, forKey: "locations")
      }
    }

    public struct Location: GraphQLSelectionSet {
      public static let possibleTypes = ["Location"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("city", type: .scalar(String.self)),
        GraphQLField("position", type: .object(Position.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, type: String? = nil, name: String? = nil, city: String? = nil, position: Position? = nil) {
        self.init(unsafeResultMap: ["__typename": "Location", "id": id, "type": type, "name": name, "city": city, "position": position.flatMap { (value: Position) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String? {
        get {
          return resultMap["id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var city: String? {
        get {
          return resultMap["city"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "city")
        }
      }

      public var position: Position? {
        get {
          return (resultMap["position"] as? ResultMap).flatMap { Position(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "position")
        }
      }

      public struct Position: GraphQLSelectionSet {
        public static let possibleTypes = ["Position"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("latitude", type: .scalar(Double.self)),
          GraphQLField("longitude", type: .scalar(Double.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(latitude: Double? = nil, longitude: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Position", "latitude": latitude, "longitude": longitude])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var latitude: Double? {
          get {
            return resultMap["latitude"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "latitude")
          }
        }

        public var longitude: Double? {
          get {
            return resultMap["longitude"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "longitude")
          }
        }
      }
    }
  }
}
