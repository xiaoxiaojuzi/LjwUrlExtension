//
//  UrlExtension.swift
//  URLExtention
//
//  Created by WangLvju on 2019/5/15.
//  Copyright © 2019 WangLvju. All rights reserved.
//

import Foundation

extension URL {
    func appendQueryItem(_ item: URLQueryItem) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        if components?.queryItems == nil {
            components?.queryItems = [item]
        } else if !URL.isContains(items: (components?.queryItems)!, item: item) {
            components?.queryItems?.append(item)
        }
        return components?.url
    }
    
    static func appendQueryItem(baseUrl: String, item: URLQueryItem) -> URL? {
        guard let url = URL(string: baseUrl) else { return nil }
        return url.appendQueryItem(item)
    }
    
    private static func isContains(items: [URLQueryItem], item: URLQueryItem) -> Bool {
        return items.contains { $0.name == item.name }
    }
}
