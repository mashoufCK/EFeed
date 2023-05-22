//
//  REmoteFeedLoaderTests.swift
//  EssenFeedTests
//
//  Created by Mashuf Chowdhury on 5/22/23.
//

import XCTest

class RemoteFeedLoader  {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {

    func get(from url: URL)
}


class HTTPClientSpy: HTTPClient {
    
      func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL : URL?
}


final class REmoteFeedLoaderTests: XCTestCase {

    func test_init() {
        
        let client = HTTPClientSpy()
         _  = RemoteFeedLoader(client)
        
        //sut.load()
        
        XCTAssertNil(client.requestedURL)

    }
    
    func test_load_requestDataFromURL () {
        let client = HTTPClientSpy()
         let sut = RemoteFeedLoader(client:  client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
