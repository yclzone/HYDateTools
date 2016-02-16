#
# Be sure to run `pod lib lint HYDateTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "HYDateTools"
  s.version          = "0.1.3"
  s.summary          = "HYDateTools is collection set of common used methods of NSDate and NSString that convert between date, date string and timeinterval."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
HYDateTools is collection set of common used methods of NSDate and NSString that convert between date, date string and timeinterval. It also include some userful methods to compare date.
                       DESC

  s.homepage         = "https://github.com/yclzone/HYDateTools"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "yclzone" => "yclzone@gmail.com" }
  s.source           = { :git => "https://github.com/yclzone/HYDateTools.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/yclzone'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'HYDateTools' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
