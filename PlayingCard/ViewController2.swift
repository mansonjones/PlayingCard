//
//  ViewController2.swift
//  PlayingCard
//
//  Created by Manson Jones on 10/24/19.
//  Copyright © 2019 Manson Jones. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    private var deck = PlayingCardDeck()
    
    @IBOutlet var cardViews: [PlayingCardView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var cards = [PlayingCard]()
        for _ in 1...((cardViews.count+1)/2) {
            let card = deck.draw()
            cards += [card!, card!]
        }
        for cardView in cardViews {
            cardView.isFaceUp = false
            let card = cards.remove(at: cards.count.arc4random)
            cardView.rank = card.rank.order
            cardView.suit = card.suit.rawValue
            cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))
        }
    }
    
    private var faceUpCardViews: [PlayingCardView] {
        return cardViews.filter { $0.isFaceUp && !$0.isHidden }
    }
    
    @objc func flipCard(_ recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            if let chosenCardView = recognizer.view as? PlayingCardView {
                UIView.transition(with: chosenCardView,
                                  duration: 0.6,
                                  options: [.transitionFlipFromLeft],
                                  animations: {
                                    chosenCardView.isFaceUp = !chosenCardView.isFaceUp
                },
                                  completion: { finished in
                                    if self.faceUpCardViews.count == 2 {
                                        self.faceUpCardViews.forEach { cardView in
                                            UIView.transition(
                                                with: cardView,
                                                duration: 0.6,
                                                options: [.transitionFlipFromLeft],
                                                animations: {
                                                    cardView.isFaceUp = false
                                            }
                                            )
                                        }
                                    }
                }
                )
            }
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}