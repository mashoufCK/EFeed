//
//  REmoteFeedLoaderTests.swift
//  EssenFeedTests
//
//  Created by Mashuf Chowdhury on 5/22/23.
//

import XCTest

class RemoteFeedLoader  {
    
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
 //not a singleton anymore, by making this a var we can  make subclasses of this
    static var shared = HTTPClient()
    
   // private init () {}
    func get(from url: URL) {
      }
    
}


class HTTPClientSpy: HTTPClient {
    
    override func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL : URL?
}


final class REmoteFeedLoaderTests: XCTestCase {

    func test_init() {
        
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _  = RemoteFeedLoader()
        
        //sut.load()
        
        XCTAssertNil(client.requestedURL)

    }
    
    func test_load_requestDataFromURL () {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
