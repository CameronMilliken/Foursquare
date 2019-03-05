//
//  ViewController.swift
//  Foursquare
//
//  Created by Cameron Milliken on 3/5/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topLeftButton = UIButton()
    let topRightButton = UIButton()
    let bottomLeftButton = UIButton()
    let bottomRightButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTopLeftButton()
        setUpTopRightButton()
        setUpBottomLeftButton()
        setUpBottomRightButton()
        addTargetsToButtons()
        changeColor()
        self.view.backgroundColor = UIColor.white
    }
    
    func setUpTopLeftButton(){
        view.addSubview(topLeftButton)
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        
        topLeftButton.backgroundColor = UIColor.green
        
        NSLayoutConstraint(item: topLeftButton, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: topLeftButton, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: topLeftButton, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 0.5, constant: 0).isActive = true
        NSLayoutConstraint(item: topLeftButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 0.5, constant: 0).isActive = true
    }
    
    func setUpTopRightButton() {
        view.addSubview(topRightButton)
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.backgroundColor = UIColor.red
        
        NSLayoutConstraint(item: topRightButton, attribute: .leading, relatedBy: .equal, toItem: topLeftButton, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: topRightButton, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: topRightButton, attribute: .top, relatedBy: .equal, toItem: topLeftButton, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: topRightButton, attribute: .bottom, relatedBy: .equal, toItem: topLeftButton, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        }
    
    func setUpBottomLeftButton() {
        view.addSubview(bottomLeftButton)
        bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftButton.backgroundColor = UIColor.blue
        
        NSLayoutConstraint(item: bottomLeftButton, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomLeftButton, attribute: .top, relatedBy: .equal, toItem: topLeftButton, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomLeftButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomLeftButton, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 0.5, constant: 0).isActive = true
    }
    
    func setUpBottomRightButton() {
        view.addSubview(bottomRightButton)
        bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomRightButton.backgroundColor = UIColor.yellow
        
        NSLayoutConstraint(item: bottomRightButton, attribute: .leading, relatedBy: .equal, toItem: topRightButton, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomRightButton, attribute: .trailing, relatedBy: .equal, toItem: topRightButton, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomRightButton, attribute: .top, relatedBy: .equal, toItem: topRightButton, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: bottomRightButton, attribute: .bottom, relatedBy: .equal, toItem: bottomLeftButton, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    func addTargetsToButtons() {
        topLeftButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        topRightButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        bottomLeftButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        bottomRightButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        
        topLeftButton.addTarget(self, action: #selector(shakeItOff(sender:)), for: .touchDragOutside)
        topRightButton.addTarget(self, action: #selector(shakeItOff(sender:)), for: .touchDragOutside)
        bottomLeftButton.addTarget(self, action: #selector(shakeItOff(sender:)), for: .touchDragOutside)
        bottomRightButton.addTarget(self, action: #selector(shakeItOff(sender:)), for: .touchDragOutside)
    }
    
    @objc func changeColor() {
        let topLeftColor = topLeftButton.backgroundColor
        let topRightColor = topRightButton.backgroundColor
        let bottomLeftColor = bottomLeftButton.backgroundColor
        let bottomRightColor = bottomRightButton.backgroundColor
        
        UIView.animate(withDuration: 0.7) {
            self.topLeftButton.backgroundColor = bottomLeftColor
            self.topRightButton.backgroundColor = topLeftColor
            self.bottomRightButton.backgroundColor = topRightColor
            self.bottomLeftButton.backgroundColor = bottomRightColor
        }
        
        topLeftButton.backgroundColor = bottomLeftColor
        topRightButton.backgroundColor = topLeftColor
        bottomRightButton.backgroundColor = topRightColor
        bottomLeftButton.backgroundColor = bottomRightColor
    }
    
    @objc func shakeItOff(sender: UIButton) {
        
        view.bringSubviewToFront(sender)
        //Find the X value of the buttons frame and then add the width divided by 2 to locate the center of the button (The center X of the button.)
        let baseValue = sender.frame.origin.x + sender.frame.width / 2
        // Create a core animation frame.
        let animation = CAKeyframeAnimation()
        // Tells the animation which axis we are going to be translating on.
        animation.keyPath = "position.x"
        // the valuse we are going to use during the animation.
        animation.values = [baseValue, baseValue + 15, baseValue, baseValue - 15, baseValue]
        // The timing for the animation.
        animation.keyTimes = [0.0, 0.25, 0.5, 0.75, 1.0]
        // The duration.
        animation.duration = 1
        // How many times the animation will run.
        animation.repeatCount = 3
        // Adding the animation to the sender.
        sender.layer.add(animation, forKey: "shakeItOff")
        
    }
    


}

