#
#  Be sure to run `pod spec lint LLCircleProgress.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LLCircleProgress"
  s.version      = "0.0.1"
  s.summary      = "Circular progress view"
  s.description  = "Circular percent based progress view"

  s.homepage     = "http://www.luizalabs.com"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author             = { "Yuri Ferretti" => "yuri.ferretti@luizalabs.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/yuriferretti-luizalabs/LLCircleProgressView.git", :tag => "#{s.version}" }
  s.source_files  = "Source/**/*.{swift}"
  s.framework  = "UIKit"

end
