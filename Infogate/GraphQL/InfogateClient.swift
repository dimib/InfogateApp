//
//  InfogateClient.swift
//  Infogate
//
//  Created by Brukakis, Dimitrios (DE) on 27.01.20.
//  Copyright © 2020 Brukakis, Dimitrios (DE). All rights reserved.
//

import Foundation
import Apollo

class InfogateClient {
    
    static let instance = InfogateClient()
    
    private lazy var networkTransport = HTTPNetworkTransport(
        url: URL(string: "https://www.mobileappserver.de/info/graphql")!,
        delegate: self
    )

    private(set) lazy var apollo = ApolloClient(networkTransport: networkTransport)
    
    func queryLocations(_ query: String, max: Int = 20, completionHandler: @escaping(_ locations: [LocationQuery.Data.Location?], _ : Error?) -> Void) -> Void {
        apollo.fetch(query: LocationQuery(query: query, max: max)) { result in
            switch result {
            case .success(let graphQLResult):
                // print(graphQLResult)
                if let locations = graphQLResult.data?.locations {
                    completionHandler(locations, nil)
                } else {
                    completionHandler([], nil)
                }
                break
                
            case .failure(let error):
                print(error)
                completionHandler([], error)
                break
            }
        }
    }
}


extension InfogateClient: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        // Request will be sent, time to add HTTP headers
    }
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true // accessToken == nil
    }
}

extension InfogateClient: HTTPNetworkTransportTaskCompletedDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, didCompleteRawTaskForRequest request: URLRequest, withData data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            print("Request finished with error: \(error)")
        }
        
        if let data = data {
            print("Request returned data: \(data)")
        }
    }
}
