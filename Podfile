# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ThatsIt' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ThatsIt
  
  # SDWebImageSwiftUI(https://github.com/SDWebImage/SDWebImageSwiftUI)
  pod 'SDWebImageSwiftUI'
  
  # NaverMap SDK
  pod 'NMapsMap','3.13.0'

  pod 'BottomSheetSwiftUI'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # Needed for building for simulator on M1 Macs
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end
