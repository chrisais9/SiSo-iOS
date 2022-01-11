# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SiSo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SiSo
  
  # Kingfisher
  pod 'Kingfisher', '~> 7.0'
  
  # NaverMap SDK
  pod 'NMapsMap','3.13.0'

  pod 'BottomSheetSwiftUI'
  
  pod 'Socket.IO-Client-Swift', '~> 15.2.0'
  
  pod 'KakaoSDK'
  
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # Needed for building for simulator on M1 Macs
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end
