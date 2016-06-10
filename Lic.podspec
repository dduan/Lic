
Pod::Spec.new do |s|

  s.name         = "Lic"
  s.version      = "0.1.2"
  s.summary      = "Easy, safe object slicing for Swift"

  s.description  = <<-DESC
                   Lic is a μ-framework that makes getting slices of arrays
                   and strings in Swift 2 safe and easy.

                   DESC

  s.homepage     = "https://github.com/dduan/Lic"

  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author             = { "Daniel Duan" => "daniel@duan.org" }
  s.social_media_url   = "https://twitter.com/Daniel_Duan"

   s.ios.deployment_target = "8.0"
   s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://github.com/dduan/Lic.git", :tag => "v#{s.version}" }

  s.source_files  = "Lic", "Lic/**/*.{swift}"

end
