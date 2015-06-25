//: [Previous](@previous)

//: # Profile

import UIKit
import XCPlayground

//: Constants
let socialButtonHeight: CGFloat = 30
let socialButtonSpacing: CGFloat = 10
let avatarImageHeight: CGFloat = 100

// Helper function to create the small social buttons on the header image.
func socialButtonWithWhite(white: CGFloat) -> UIButton {
  let button = UIButton(type: .Custom)
  button.backgroundColor = UIColor(white: white, alpha: 1.0)
  button.layer.cornerRadius = ceil(socialButtonHeight/2)
  return button
}

//: First we need a `hostView` to put the different elements on.
let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
hostView.backgroundColor = UIColor.lightGrayColor()
XCPShowView("hostView", view: hostView)

/*:
Those elements are:

- a header image
*/
let headerImageView = UIImageView(frame: CGRect.zeroRect)
headerImageView.backgroundColor = UIColor.yellowColor()
headerImageView.contentMode = .ScaleAspectFill

//: - different social button (App.net, Twitter, StackOverflow, Github)
let adnButton = socialButtonWithWhite(0.2)
let twitterButton = socialButtonWithWhite(0.3)
let stackOverflowButton = socialButtonWithWhite(0.4)
let githubButton = socialButtonWithWhite(0.5)

//: - avatar image
let avatarImageView = UIImageView(frame: CGRect.zeroRect)
avatarImageView.backgroundColor = UIColor(white: 0.6, alpha: 1.0)
avatarImageView.layer.cornerRadius = ceil(avatarImageHeight/2)
avatarImageView.layer.borderColor = UIColor.grayColor().CGColor
avatarImageView.layer.borderWidth = 2
avatarImageView.clipsToBounds = true
avatarImageView.contentMode = .ScaleAspectFit

//: - the name
let nameLabel = UILabel(frame: CGRect.zeroRect)
nameLabel.text = "Dominik Hauser"
nameLabel.font = UIFont(name: "Avenir-Medium", size: 25)
nameLabel.textColor = UIColor.whiteColor()

//: - the handle
let handleLabel = UILabel(frame: CGRect.zeroRect)
handleLabel.text = "dasdom"
handleLabel.font = UIFont(name: "Avenir-Book", size: 18)
handleLabel.textColor = UIColor.lightGrayColor()

//: - a short bio of the user
let bioLabel = UILabel(frame: CGRect.zeroRect)
bioLabel.text = "iOS dev durung the day. iOS dev at night. Father and husband all time. Auto Layout master. Swift lover"
bioLabel.numberOfLines = 0
bioLabel.font = UIFont(name: "Avenir-Oblique", size: 13)
bioLabel.textAlignment = .Center
bioLabel.textColor = UIColor.lightGrayColor()

// dark background color
hostView.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.14, alpha: 1.0)

//: This if statement is needed, otherwise the Playground isn't executed.
if #available(iOS 9, *) {
  /*:
  ## Building the user interface
  
  The user interface is build using four `UIStackView`s.
  
  - a vertical stack view for the round social buttons on top of the header image
  */
  let socialButtonStackView = UIStackView(arrangedSubviews: [adnButton, twitterButton, stackOverflowButton, githubButton])
  socialButtonStackView.axis = .Vertical
  socialButtonStackView.spacing = socialButtonSpacing
  socialButtonStackView.distribution = .FillEqually
  socialButtonStackView.alignment = .Center
  
  //: - a horizontal stack view for the header view and the social button stack view (note: the spacing is negative)
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
  
  hostView.addSubview(mainStackView)
  
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

headerImageView.image = UIImage(named: "DSC_1165.jpg")
avatarImageView.image = UIImage(named: "IMG_0345.jpg")

hostView

//: [Next](@next)
