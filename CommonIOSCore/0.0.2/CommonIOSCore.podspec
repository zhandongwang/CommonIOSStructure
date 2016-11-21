Pod::Spec.new do |s|
  s.name             = 'CommonIOSCore'
  s.version          = '0.0.2'
  s.summary          = 'CommonIOSCore contains somme common tools'

  s.description      = <<-DESC
                       this podspec will include all common tools that used in CommonIOSStructure
                       DESC

  s.homepage         = 'https://github.com/zhandongwang/CommonIOSCore'
  s.license          = 'MIT'
  s.author           = { 'fengli' => 'fengli@2dfire.com' }
  s.source           = { :git => 'https://github.com/zhandongwang/CommonIOSCore.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'
  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/NSBundle+Podspec.h'
end
