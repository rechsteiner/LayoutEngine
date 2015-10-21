Pod::Spec.new do |s|
  s.name         = "LayoutEngine"
  s.version      = "0.0.1"
  s.summary      = "Manually calculate frames for views stacked on top of each-other"
  s.description  = <<-DESC
LayoutEngine is a tiny framework that allows you to declarativly define how views should be stacked on top of each-other and manually update their frame. Ideal when auto-layout is not performant enough.
                   DESC
  s.homepage     = "https://github.com/rechsteiner/LayoutEngine"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author    = "Martin Rechsteiner"
  s.social_media_url   = "http://twitter.com/rechsteiner"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/rechsteiner/LayoutEngine.git", :tag => "0.0.1" }
  s.source_files  = "LayoutEngine/*.swift"
  s.requires_arc = true
end
