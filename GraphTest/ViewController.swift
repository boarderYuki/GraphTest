//
//  ViewController.swift
//  GraphTest
//
//  Created by yuki.pro on 2018. 6. 8..
//  Copyright © 2018년 yuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graph_1: NSLayoutConstraint!
    @IBOutlet weak var graph_2: NSLayoutConstraint!
    @IBOutlet weak var graph_3: NSLayoutConstraint!
    @IBOutlet weak var graph_4: NSLayoutConstraint!
    @IBOutlet weak var graph_5: NSLayoutConstraint!
    @IBOutlet weak var graph_6: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRandumGraph()
    }

    @IBAction func refreshGraph(_ sender: Any) {
        
        getRandumGraph()
    }
    
    
    func getRandumGraph() {
        var randumList : [CGFloat] = []
        for _ in 0...5 {
            let t = CGFloat.random
            randumList.append(t)
        }
        
        graph_1 = graph_1.changeMultiplier(chnageMultiplier: randumList[0])
        graph_2 = graph_2.changeMultiplier(chnageMultiplier: randumList[1])
        graph_3 = graph_3.changeMultiplier(chnageMultiplier: randumList[2])
        graph_4 = graph_4.changeMultiplier(chnageMultiplier: randumList[3])
        graph_5 = graph_5.changeMultiplier(chnageMultiplier: randumList[4])
        graph_6 = graph_6.changeMultiplier(chnageMultiplier: randumList[5])
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        
    }
        
}


extension Float {
    
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random: Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }
    
}

extension CGFloat {

    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random: CGFloat {
        return CGFloat(Float.random)
    }

}

extension NSLayoutConstraint {
    func changeMultiplier(chnageMultiplier: CGFloat) -> NSLayoutConstraint{
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: self.firstItem!,
            attribute: self.firstAttribute,
            relatedBy: self.relation,
            toItem: self.secondItem,
            attribute: self.secondAttribute,
            multiplier: chnageMultiplier,
            constant: self.constant
        )
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}
