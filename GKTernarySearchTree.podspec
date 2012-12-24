#
# Be sure to run `pod spec lint GKTernarySearchTree.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec. Optional attributes are commented.
#
# For details see: https://github.com/CocoaPods/CocoaPods/wiki/The-podspec-format
#
Pod::Spec.new do |s|
  s.name         = "GKTernarySearchTree"
  s.version      = "0.0.1"
  s.license      = 'MIT'
  s.summary      = "Ternary Search Tree implementation for iOS."
  s.homepage     = "http://github.com/gaku/GKTernarySearchTree"

  s.author       = { "Gaku Ueda" => "gaku@gaku.net" }
  s.source = { :git => "https://github.com/gaku/GKTernarySearchTree.git", :tag => '0.0.1' }
  s.platform     = :ios
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end
