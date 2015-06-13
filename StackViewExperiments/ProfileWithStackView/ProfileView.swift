//
//  ProfileView.swift
//  StackViewExperiments
//
//  Created by dasdom on 12.06.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

private let socialButtonHeight: CGFloat = 30
private let socialButtonSpacing: CGFloat = 10
private let avatarImageHeight: CGFloat = 100

class ProfileWithStackView: UIView {
  
  let headerImageView: UIImageView
  
  let adnButton: UIButton
  let twitterButton: UIButton
  let stackOverflowButton: UIButton
  let githubButton: UIButton
  
  let avatarImageView: UIImageView

  let nameLabel: UILabel
  let handleLabel: UILabel

  let bioLabel: UILabel
  
  override init(frame: CGRect) {
    
    headerImageView = UIImageView(frame: CGRect.zeroRect)
    headerImageView.backgroundColor = UIColor.yellowColor()
    headerImageView.contentMode = .ScaleAspectFill
    
    func socialButtonWithWhite(white: CGFloat) -> UIButton {
      let button = UIButton(type: .Custom)
      button.backgroundColor = UIColor(white: white, alpha: 1.0)
      button.layer.cornerRadius = ceil(socialButtonHeight/2)
      return button
    }
    
    adnButton = socialButtonWithWhite(0.2)
    twitterButton = socialButtonWithWhite(0.3)
    stackOverflowButton = socialButtonWithWhite(0.4)
    githubButton = socialButtonWithWhite(0.5)

    avatarImageView = UIImageView(frame: CGRect.zeroRect)
    avatarImageView.backgroundColor = UIColor(white: 0.6, alpha: 1.0)
    avatarImageView.layer.cornerRadius = ceil(avatarImageHeight/2)
    avatarImageView.layer.borderColor = UIColor.grayColor().CGColor
    avatarImageView.layer.borderWidth = 2
    avatarImageView.clipsToBounds = true
    avatarImageView.contentMode = .ScaleAspectFit

    nameLabel = UILabel(frame: CGRect.zeroRect)
    nameLabel.text = "Dominik Hauser"
    nameLabel.font = UIFont(name: "Avenir-Medium", size: 25)
    nameLabel.textColor = UIColor.whiteColor()
    
    handleLabel = UILabel(frame: CGRect.zeroRect)
    handleLabel.text = "dasdom"
    handleLabel.font = UIFont(name: "Avenir-Book", size: 18)
    handleLabel.textColor = UIColor.lightGrayColor()
    
    bioLabel = UILabel(frame: CGRect.zeroRect)
    bioLabel.text = "iOS dev durung the day. iOS dev at night. Father and husband all time. Auto Layout master. Swift lover"
    bioLabel.numberOfLines = 0
    bioLabel.font = UIFont(name: "Avenir-Oblique", size: 13)
    bioLabel.textAlignment = .Center
    bioLabel.textColor = UIColor.lightGrayColor()
//    bioLabel.backgr oundColor = UIColor.yellowColor()
    
    super.init(frame: frame)
    backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.14, alpha: 1.0)
    
    let socialButtonStackView = UIStackView(arrangedSubviews: [adnButton, twitterButton, stackOverflowButton, githubButton])
    socialButtonStackView.axis = .Vertical
    socialButtonStackView.spacing = socialButtonSpacing
    socialButtonStackView.distribution = .FillEqually
    socialButtonStackView.alignment = .Center
    
    let headerStackView = UIStackView(arrangedSubviews: [headerImageView, socialButtonStackView])
    headerStackView.spacing = -(socialButtonHeight+socialButtonSpacing*2)
    headerStackView.alignment = .Center
    
    let personInfoStackView = UIStackView(arrangedSubviews: [avatarImageView, nameLabel, handleLabel, bioLabel])
    personInfoStackView.axis = .Vertical
    personInfoStackView.alignment = .Center
    personInfoStackView.spacing = 10
    
    let mainStackView = UIStackView(arrangedSubviews: [headerStackView, personInfoStackView])
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    mainStackView.axis = .Vertical
    mainStackView.alignment = .Center
    mainStackView.spacing = -ceil(avatarImageHeight/2)
    
    addSubview(mainStackView)

    // MARK: - Layout
    headerImageView.heightAnchor.constraintEqualToConstant(220).active = true
    socialButtonStackView.widthAnchor.constraintEqualToConstant(socialButtonHeight+socialButtonSpacing*2).active = true
    
    let numberOfSocialButtons = CGFloat(socialButtonStackView.arrangedSubviews.count)
    let socialButtonStackViewHeight = numberOfSocialButtons * socialButtonHeight + (numberOfSocialButtons - 1) * socialButtonSpacing
    socialButtonStackView.heightAnchor.constraintEqualToConstant(socialButtonStackViewHeight).active = true
    
    avatarImageView.widthAnchor.constraintEqualToConstant(avatarImageHeight).active = true
    avatarImageView.heightAnchor.constraintEqualToConstant(avatarImageHeight).active = true
    
    let views = ["stackView": mainStackView, "headerStackView": headerStackView, "bio": bioLabel]
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[headerStackView]|", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-10-[bio]", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[stackView]|", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[stackView]", options: [], metrics: nil, views: views))
    
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

}
