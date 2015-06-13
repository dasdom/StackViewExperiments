//
//  ProfileWithAutoLayoutViewController.swift
//  StackViewExperiments
//
//  Created by dasdom on 13.06.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

class ProfileWithAutoLayoutViewController: UIViewController {

  override func loadView() {
    let profileView = ProfileWithAutoLayoutView(frame: CGRect.zeroRect)
    
    profileView.headerImageView.image = UIImage(named: "header")
    profileView.avatarImageView.image = UIImage(named: "avatar")
    
    view = profileView
  }

}
