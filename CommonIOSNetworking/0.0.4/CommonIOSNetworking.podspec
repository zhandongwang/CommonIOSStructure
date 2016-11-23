
Pod::Spec.new do |s|

  s.name         = "CommonIOSNetworking"
  s.version      = "0.0.4"
  s.summary      = "Common network access for ios app"
  s.description  = <<-DESC
                    Common network access for ios app using AFNetworking
                   DESC

  s.homepage     = "https://github.com/zhandongwang/CommonIOSNetworking"
  s.license      = "MIT"
  s.author             = { "fengli" => "fengli@2dfire.com" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/zhandongwang/CommonIOSNetworking.git", :tag => s.version.to_s }
  s.source_files  = "Classes", "Pod/Classes/**/*.{h,m}"

  s.requires_arc = true
  s.dependency "AFNetworking"

end
