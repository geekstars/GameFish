//
//  ViewController.swift
//  GameFish
//
//  Created by Hoàng Minh Thành on 8/29/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameManager : GameManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameManager = GameManager()
        self.view.addSubview((self.gameManager?.hookView)!)
        self.gameManager?.addFishToviewController(self, width: Int(self.view.bounds.width))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(tapHandle)))
        NSTimer.scheduledTimerWithTimeInterval(0.025, target: self.gameManager!, selector: #selector(self.gameManager?.updateMove), userInfo: nil, repeats: true)
    }
    func tapHandle(sender:UIGestureRecognizer)
    {
        let tapPoint = sender.locationInView(self.view)
        self.gameManager?.dropHookerAtX(Int(tapPoint.x))
    }
    @IBAction func reset(sender: UIButton) {
        self.gameManager?.fishViews?.removeAllObjects()
        for object in self.view.subviews
        {
            if(object .isKindOfClass(FishView))
            {
                object .removeFromSuperview()
            }
        }
        self.gameManager?.addFishToviewController(self, width: Int(self.view.bounds.width))
    }

    @IBAction func addfish(sender: UIButton) {
        self.gameManager?.addFishToviewController(self, width: Int(self.view.bounds.width))
    }
}

