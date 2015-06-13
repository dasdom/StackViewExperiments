//
//  ProfileViewController.swift
//  StackViewExperiments
//
//  Created by dasdom on 12.06.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

class ProfileWithStackViewViewController: UIViewController {

  override func loadView() {
    let profileView = ProfileWithStackView(frame: CGRect.zeroRect)
 
    profileView.headerImageView.image = UIImage(named: "header")
    profileView.avatarImageView.image = UIImage(named: "avatar")
    
    view = profileView
  }

}
