//
//  ProfileWithAutoLayoutView.swift
//  StackViewExperiments
//
//  Created by dasdom on 13.06.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

private let socialButtonHeight: CGFloat = 30
private let socialButtonSpacing: CGFloat = 10
private let avatarImageHeight: CGFloat = 100

class ProfileWithAutoLayoutView: UIView {

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
    headerImageView.translatesAutoresizingMaskIntoConstraints = false
    headerImageView.backgroundColor = UIColor.yellowColor()
    headerImageView.contentMode = .ScaleAspectFill
    
    func socialButtonWithWhite(white: CGFloat) -> UIButton {
      let button = UIButton(type: .Custom)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.backgroundColor = UIColor(white: white, alpha: 1.0)
      button.layer.cornerRadius = ceil(socialButtonHeight/2)
      return button
    }
    
    adnButton = socialButtonWithWhite(0.2)
    twitterButton = socialButtonWithWhite(0.3)
    stackOverflowButton = socialButtonWithWhite(0.4)
    githubButton = socialButtonWithWhite(0.5)
    
    avatarImageView = UIImageView(frame: CGRect.zeroRect)
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    avatarImageView.backgroundColor = UIColor(white: 0.6, alpha: 1.0)
    avatarImageView.layer.cornerRadius = ceil(avatarImageHeight/2)
    avatarImageView.layer.borderColor = UIColor.grayColor().CGColor
    avatarImageView.layer.borderWidth = 2
    avatarImageView.clipsToBounds = true
    avatarImageView.contentMode = .ScaleAspectFit
    
    nameLabel = UILabel(frame: CGRect.zeroRect)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.text = "Dominik Hauser"
    nameLabel.font = UIFont(name: "Avenir-Medium", size: 25)
    nameLabel.textColor = UIColor.whiteColor()
    
    handleLabel = UILabel(frame: CGRect.zeroRect)
    handleLabel.translatesAutoresizingMaskIntoConstraints = false
    handleLabel.text = "dasdom"
    handleLabel.font = UIFont(name: "Avenir-Book", size: 18)
    handleLabel.textColor = UIColor.lightGrayColor()
    
    bioLabel = UILabel(frame: CGRect.zeroRect)
    bioLabel.translatesAutoresizingMaskIntoConstraints = false
    bioLabel.text = "iOS dev durung the day. iOS dev at night. Father and husband all time. Auto Layout master. Swift lover"
    bioLabel.numberOfLines = 0
    bioLabel.font = UIFont(name: "Avenir-Oblique", size: 13)
    bioLabel.textAlignment = .Center
    bioLabel.textColor = UIColor.lightGrayColor()
//    bioLabel.backgroundColor = UIColor.yellowColor()

    super.init(frame: frame)
    backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.14, alpha: 1.0)
    
    let socialLayoutGuide = UILayoutGuide()
    
    addSubview(headerImageView)
    addSubview(adnButton)
    addSubview(twitterButton)
    addLayoutGuide(socialLayoutGuide)
    addSubview(stackOverflowButton)
    addSubview(githubButton)
    addSubview(avatarImageView)
    addSubview(nameLabel)
    addSubview(handleLabel)
    addSubview(bioLabel)
    
    let views = ["headerImage": headerImageView, "adn": adnButton, "twitter": twitterButton, "stackOverflow": stackOverflowButton, "github": githubButton, "socialLayoutGuide": socialLayoutGuide, "avatarImage": avatarImageView, "name": nameLabel, "handle": handleLabel, "bio": bioLabel]
    let metrics = ["socialButtonHeight": socialButtonHeight, "spacing": socialButtonSpacing, "avatarImageSpacing": -ceil(avatarImageHeight/2)]
    
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[headerImage]|", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[headerImage(220)]", options: [], metrics: nil, views: views))
    
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[adn]-10-|", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[adn(socialButtonHeight,twitter,stackOverflow,github)]-(spacing)-[twitter][socialLayoutGuide(spacing)][stackOverflow]-(spacing)-[github]", options: .AlignAllTrailing, metrics: metrics, views: views))
    
    socialLayoutGuide.centerYAnchor.constraintEqualToAnchor(headerImageView.centerYAnchor).active = true

    avatarImageView.heightAnchor.constraintEqualToConstant(avatarImageHeight).active = true
    avatarImageView.widthAnchor.constraintEqualToConstant(avatarImageHeight).active = true

    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[headerImage]-(avatarImageSpacing)-[avatarImage]-(spacing)-[name]-(spacing)-[handle]-(spacing)-[bio]", options: .AlignAllCenterX, metrics: metrics, views: views))
    
    NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[bio]-|", options: [], metrics: metrics, views: views))
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}
