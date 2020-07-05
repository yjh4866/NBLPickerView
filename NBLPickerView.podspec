#
# Be sure to run `pod lib lint NBLPickerView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NBLPickerView'
  s.version          = '0.1.2'
  s.summary          = 'Object-C。基于UIPickerView的列表选择。based on UIPickerView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Object-C。基于UIPickerView的列表选择，目前只支持一列。based on UIPickerView.
                       DESC

  s.homepage         = 'https://github.com/yjh4866/NBLPickerView'
  s.screenshots     = 'https://gitee.com/yjh4866/NBLPickerView/raw/master/screenshots/screenshots_1.png', 'https://gitee.com/yjh4866/NBLPickerView/raw/master/screenshots/screenshots_2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '杨建红' => 'yjh4866@163.com' }
  s.source           = { :git => 'https://github.com/yjh4866/NBLPickerView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://blog.csdn.net/yjh4866'

  s.ios.deployment_target = '9.0'

  s.source_files = 'NBLPickerView/Classes/**/*'
  
   s.resource_bundles = {
     'NBLPickerView' => ['NBLPickerView/Assets/*.{xib}']
   }

   s.public_header_files = 'NBLPickerView/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
