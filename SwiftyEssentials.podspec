#
# Be sure to run `pod lib lint SwiftyEssentials.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyEssentials'
  s.version          = '1.0.2'
  s.summary          = 'Classes and extensions to simplify the generally iOS development on Swift.'
  s.swift_version    = '3.2'
  s.description      = <<-DESC
Set of classes and extensions that simplifies the daily development of applications in Swift.
                       DESC

  s.homepage         = 'https://github.com/josuemeza/SwiftyEssentials'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Josue Meza Peña' => 'contacto@josuemeza.com' }
  s.source           = { :git => 'https://github.com/josuemeza/SwiftyEssentials.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SwiftyEssentials/Classes/**/*'

  # s.resource_bundles = {
  #   'SwiftyEssentials' => ['SwiftyEssentials/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
