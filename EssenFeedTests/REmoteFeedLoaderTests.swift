//
//  REmoteFeedLoaderTests.swift
//  EssenFeedTests
//
//  Created by Mashuf Chowdhury on 5/22/23.
//

import XCTest

class RemoteFeedLoader  {
    
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
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
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        _  = RemoteFeedLoader(url: url, client: client)
        
        //sut.load()
        
        XCTAssertNil(client.requestedURL)

    }
    
    func test_load_requestDataFromURL () {
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client:  client)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
}
