Pod::Spec.new do |s|
  s.name             = 'CommonIOSRootPage'
  s.version          = '0.1.7'
  s.summary          = 'A common rootpage for iOS.'

  s.description      = <<-DESC
                        This podspec can be used as rootpage for an iOS app.
                       DESC

  s.homepage         = 'https://github.com/zhandongwang/CommonIOSRootPage'
  s.license          = 'MIT'
  s.author           = { 'fengli' => 'fengli@2dfire.com' }
  s.source           = { :git => 'https://github.com/zhandongwang/CommonIOSRootPage.git', :tag => s.version.to_s }
  s.platform = :ios
  s.ios.deployment_target = '7.0'
  s.source_files = 'CommonIOSRootPage/Pod/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'CommonIOSRootPage' => ['CommonIOSRootPage/Assets/*.png}']
  # }

  s.prefix_header_contents = '#import <UIKit/UIKit.h>', '#import "ZDWExtentions.h"','#import "AppMacro.h"'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  #s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
