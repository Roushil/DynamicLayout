//
//  ViewController.swift
//  DigitalHorizonLayout
//
//  Created by Roushil singla on 5/29/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bgView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var signAsGuestButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet var viewLeftConstraints: [NSLayoutConstraint]!
    @IBOutlet var viewsWidth: [NSLayoutConstraint]!
    
    
    let logo: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Mountain")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation.isLandscape{
            adjustViewInLandscapeMode()
                        
        }else if UIDevice.current.orientation.isPortrait{
            adjustViewInPortraitMode()
        }
    }
}

extension ViewController {
    
    func setUpButtons(){
    
        nextButton.layer.cornerRadius = nextButton.frame.height / 4
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.systemBlue.cgColor
        signAsGuestButton.layer.cornerRadius = signAsGuestButton.frame.height / 4
        signAsGuestButton.layer.borderWidth = 1
        signAsGuestButton.layer.borderColor = UIColor.white.cgColor
    }
    
    
    func adjustViewInPortraitMode() {
        
        logoImage.isHidden = false
        logo.removeFromSuperview()
        
        for views in viewLeftConstraints{
            views.constant = 0
        }
        for view in viewsWidth{
            view.constant = 0
        }

    }
    
    func adjustViewInLandscapeMode() {
        
        logoImage.isHidden = true

        for views in viewLeftConstraints{
            views.constant = 100
        }
        for view in viewsWidth{
            view.constant = -100
        }
        
        bgView.addSubview(logo)
        bgView.addConstraints([NSLayoutConstraint(item: bgView!,
                                                  attribute: .centerY,
                                                  relatedBy: .equal,
                                                  toItem: logo,
                                                  attribute: .centerY,
                                                  multiplier: 1.0,
                                                  constant: 0.0)])
        
        logo.anchor(top: nil,
                      leading: view.leadingAnchor,
                      bottom: nil,
                      trailing: nil,
                      padding: .init(top: 0, left: 50, bottom: 0, right: 0),
                      size: .init(width: 80,
                                  height: 80))

    }
}

