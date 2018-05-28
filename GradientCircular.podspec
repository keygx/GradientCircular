Pod::Spec.new do |s|
  s.name = "GradientCircular"
  s.version = "1.0.0"
  s.summary = "Customizable gradient circular Image and ImageView library in Swift."
  s.homepage = "https://github.com/keygx/GradientCircular"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "keygx" => "y.kagiyama@gmail.com" }
  s.social_media_url = "http://twitter.com/keygx"
  s.platform = :ios
  s.ios.deployment_target = "9.0"
  s.swift_version= "4.0"
  s.source = { :git => "https://github.com/keygx/GradientCircular.git", :tag => "#{s.version}" }
  s.source_files = "GradientCircular/**/*"
  s.requires_arc = true
end
