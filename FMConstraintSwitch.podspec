Pod::Spec.new do |s|
  s.name         = "FMConstraintSwitch"
  s.version      = "0.0.6"
  s.summary      = "Easier modification of constraints to define different states of the view hierarchy"
  s.homepage     = "https://github.com/fer662/FMConstraintSwitch"
  s.license      = 'MIT'
  s.author       = { "Fernando Mazzon" => "fer662@gmail.com" }
  s.source       = { :git => "https://github.com/fer662/FMConstraintSwitch.git", :tag => "0.0.6" }
  s.platform     = :ios
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.requires_arc = true
end
