//
//  FeedLoader.swift
//  EssenFeed
//
//  Created by Mashuf Chowdhury on 5/22/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
    
}
