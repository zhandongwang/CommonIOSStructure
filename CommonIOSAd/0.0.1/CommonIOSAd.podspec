Pod::Spec.new do |s|
  s.name             = 'CommonIOSAd'
  s.version          = '0.0.1'
  s.summary          = 'CommonIOSAd is a test.'
  s.description      = <<-DESC
                       Testing Public Posdspec for future.
                       DESC

  s.homepage         = 'https://github.com/zhandongwang/CommonIOSAd'
  s.license          = 'MIT'
  s.author           = { 'fengli' => 'fengli@2dfire.com' }
  s.source           = { :git => 'https://github.com/zhandongwang/CommonIOSAd.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = 'CommonIOSAd/Classes/**/*'
  
   #s.resource_bundles = {
   #  'CommonIOSAd' => ['CommonIOSAd/Assets/*.png']
   #}

   s.public_header_files = 'CommonIOSAd/Classes/ZDWCommonAdService.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
