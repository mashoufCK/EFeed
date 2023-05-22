//
//  REmoteFeedLoaderTests.swift
//  EssenFeedTests
//
//  Created by Mashuf Chowdhury on 5/22/23.
//

import XCTest

class RemoteFeedLoader  {
    
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
 
    static let shared = HTTPClient()
    
    private init () {}
    
    var requestedURL : URL?
}

final class REmoteFeedLoaderTests: XCTestCase {

    func test_init() {
        
        let client = HTTPClient.shared
        
        _  = RemoteFeedLoader()
        
        //sut.load()
        
        XCTAssertNil(client.requestedURL)

    }
    
    func test_load_requestDataFromURL () {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
