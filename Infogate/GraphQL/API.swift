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
        departures(max: 10) {
          __typename
          transport {
            __typename
            name
            direction
          }
          departureReal
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
        GraphQLField("departures", arguments: ["max": 10], type: .list(.object(Departure.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, type: String? = nil, name: String? = nil, city: String? = nil, position: Position? = nil, departures: [Departure?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Location", "id": id, "type": type, "name": name, "city": city, "position": position.flatMap { (value: Position) -> ResultMap in value.resultMap }, "departures": departures.flatMap { (value: [Departure?]) -> [ResultMap?] in value.map { (value: Departure?) -> ResultMap? in value.flatMap { (value: Departure) -> ResultMap in value.resultMap } } }])
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

      public var departures: [Departure?]? {
        get {
          return (resultMap["departures"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Departure?] in value.map { (value: ResultMap?) -> Departure? in value.flatMap { (value: ResultMap) -> Departure in Departure(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Departure?]) -> [ResultMap?] in value.map { (value: Departure?) -> ResultMap? in value.flatMap { (value: Departure) -> ResultMap in value.resultMap } } }, forKey: "departures")
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

      public struct Departure: GraphQLSelectionSet {
        public static let possibleTypes = ["Departures"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("transport", type: .object(Transport.selections)),
          GraphQLField("departureReal", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(transport: Transport? = nil, departureReal: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Departures", "transport": transport.flatMap { (value: Transport) -> ResultMap in value.resultMap }, "departureReal": departureReal])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var transport: Transport? {
          get {
            return (resultMap["transport"] as? ResultMap).flatMap { Transport(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "transport")
          }
        }

        public var departureReal: String? {
          get {
            return resultMap["departureReal"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "departureReal")
          }
        }

        public struct Transport: GraphQLSelectionSet {
          public static let possibleTypes = ["Transport"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("direction", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, direction: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Transport", "name": name, "direction": direction])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          public var direction: String? {
            get {
              return resultMap["direction"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "direction")
            }
          }
        }
      }
    }
  }
}
