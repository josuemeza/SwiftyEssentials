#
# Be sure to run `pod lib lint SwiftyEssentials.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                    = 'SwiftyEssentials'
  s.version                 = '1.0.7'
  s.summary                 = 'Classes and extensions to simplify the generally iOS development on Swift.'
  s.swift_version           = '3.2'
  s.description             = 'Set of classes and extensions that simplifies the daily development of applications in Swift.'
  s.homepage                = 'https://github.com/josuemeza/SwiftyEssentials'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.author                  = { 'Josue Meza Peña' => 'contacto@josuemeza.com' }
  s.source                  = { :git => 'https://github.com/josuemeza/SwiftyEssentials.git', :tag => s.version.to_s }
  s.ios.deployment_target   = '10.0'
  s.frameworks              = 'UIKit'
  s.source_files            = 'SwiftyEssentials/Classes/**/*'
  s.documentation_url       = 'http://josuemeza.com/pods/SwiftyEssentials/'
end
