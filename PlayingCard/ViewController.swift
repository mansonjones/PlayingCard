//
//  ViewController.swift
//  PlayingCard
//
//  Created by Manson Jones on 10/23/19.
//  Copyright © 2019 Manson Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }


}

