//
//  URLExtentionTests.swift
//  URLExtentionTests
//
//  Created by WangLvju on 2019/5/15.
//  Copyright © 2019 WangLvju. All rights reserved.
//

@testable import URLExtention
import Quick
import Nimble

class UrlUsingStringSpec: QuickSpec {
    override func spec() {
        describe("test AppendQueryItem") {
            it("shoud append new query item, when the url doesn't have query item") {
                let baseURL = "https://github.com/"
                let itemName = "a"
                let itemValue = "1"
                let expectURL = baseURL + "?" + itemName + "=" + itemValue
                let newURL = URL.appendQueryItem(baseUrl: baseURL, item: URLQueryItem(name: itemName, value: itemValue))
                expect(newURL?.absoluteString).to(equal(expectURL))
            }
            it("shoud append new query item, when the url has a query item using other name") {
                let baseURL = "https://github.com/?a=1"
                let itemName = "b"
                let itemValue = "2"
                let expectURL = baseURL + "&" + itemName + "=" + itemValue
                let newURL = URL.appendQueryItem(baseUrl: baseURL, item: URLQueryItem(name: itemName, value: itemValue))
                expect(newURL?.absoluteString).to(equal(expectURL))
            }
            it("shoud not append new query item, when the url has a query item using same name") {
                let baseURL = "https://github.com/?a=1"
                let itemName = "a"
                let itemValue = "2"
                let expectURL = baseURL
                let newURL = URL.appendQueryItem(baseUrl: baseURL, item: URLQueryItem(name: itemName, value: itemValue))
                expect(newURL?.absoluteString).to(equal(expectURL))
            }
        }
    }
}

