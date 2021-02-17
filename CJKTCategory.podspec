#
#  Be sure to run `pod spec lint CJKTCategory.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

 

  s.name         = "CJKTCategory"
  s.version      = "0.1.7"
  s.summary      = "CJKTCategory:一些常用的Category"

 
  s.description  = <<-DESC
             CJKTCategory:项目中一些常用的Category
                   DESC

  s.homepage     = "https://github.com/Dxc123/CJKTCategory"
  

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  

  s.author             = { "Dxc123" => "daixingchuang@163.com" }
 
  s.platform     = :ios, '10.0'
  s.ios.deployment_target = '10.0'
  s.source       = { :git => 'https://github.com/Dxc123/CJKTCategory.git', :tag => "v0.1.7"}

  s.requires_arc = true
  s.source_files  = "CJKTCategory/**/*.{h,m}"
  #

  s.public_header_files = "CJKTCategory/**/*.{h}"

  s.frameworks = 'UIKit', 'CoreFoundation','CoreText', 'QuartzCore', 'Accelerate', 'MobileCoreServices'

 
  
  # s.dependency "JSONKit", "~> 1.4"

end
