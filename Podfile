source 'https://cdn.cocoapods.org'
platform :ios, '13.5'
inhibit_all_warnings!

target 'Common' do
  use_frameworks! :linkage => :static

  pod 'Firebase/Core', '~> 6.27'

  target 'SPMDemoApp' do
    inherit! :search_paths
  end

  target 'SPMDemoAppTests' do
    inherit! :search_paths
  end
  
  target 'CommonTests' do
    inherit! :search_paths
  end
  
  target 'FeatureA' do
    inherit! :search_paths
  end

  target 'FeatureATests' do
    inherit! :search_paths
  end

  target 'FeatureB' do
    inherit! :search_paths
  end

  target 'FeatureBTests' do
    inherit! :search_paths
  end
end
