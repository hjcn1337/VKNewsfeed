//
//  FeedViewController.swift
//  VKNewsfeed
//
//  Created by Ростислав Ермаченков on 28.11.2020.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    
    private let networkService: Networking = NetworkService()
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map { (feedItem)  in
                print(feedItem.date)
            }
        }
        
    }
}
