//
//  URL+Helpers.swift
//  SpacePhoto
//
//  Created by Student04 on 2019-05-14.
//  Copyright © 2019 Student04. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
            { URLQueryItem(name: $0.0, value: $0.1) }
                return components?.url
        }
    }

