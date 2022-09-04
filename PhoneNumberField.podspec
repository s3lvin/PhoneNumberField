#
# Be sure to run `pod lib lint PhoneNumberField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PhoneNumberField'
  s.version          = '0.9.0'
  s.summary          = 'A SwiftUI Phone Number TextField with country code picker'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Letting users to choose a country's dialing code easily in a SwiftUI TextField has been a problem. For example if you need a PhoneNumberField for OTP validation, you need to ask user to somehow specify the dialing code of a country. This library attempts to solve this by offering a searchable dialing code picker for a phone number TextField.
                       DESC

  s.homepage         = 'https://github.com/s3lvin/PhoneNumberField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Selvin' => 'mariaselvin@gmail.com' }
  s.source           = { :git => 'https://github.com/s3lvin/PhoneNumberField.git', :tag => s.version.to_s }


  s.ios.deployment_target = '14.0'

  s.source_files = 'Source/*.swift'
  
   s.resource_bundles = {
     'PhoneNumberField' => ['Resources/*.json']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'SwiftUI'
  # s.dependency 'AFNetworking', '~> 2.3'
end
