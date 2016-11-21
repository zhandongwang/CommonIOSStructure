Pod::Spec.new do |s|
  s.name             = 'CommonIOSAd'
  s.version          = '0.1.4'
  s.summary          = 'CommonIOSAd is an ad service.'
  s.description      = <<-DESC
                       CommonIOSAd provide the service used for Common IOS app.
                       DESC

  s.homepage         = 'https://github.com/zhandongwang/CommonIOSAd'
  s.license          = 'MIT'
  s.author           = { 'fengli' => 'fengli@2dfire.com' }
  s.source           = { :git => 'https://github.com/zhandongwang/CommonIOSAd.git', :tag => s.version.to_s }

  s.platform = :ios
  s.ios.deployment_target = '7.0'
  
  s.source_files = 'Pod/Classes/**/*.{h,m}'
  s.resource_bundles = {
     'CommonIOSAd' => ['Pod/Assets/*']
   }

   #s.public_header_files = 'Pod/Headers/Public/*.h'
   s.dependency 'CommonIOSCore', '~> 0.0.3'

   end
