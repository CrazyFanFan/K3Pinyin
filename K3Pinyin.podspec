Pod::Spec.new do |s|
  s.name    = "K3Pinyin"
  s.version = "0.0.2"
  s.summary = "a simple wap to use pinyin with swift."

  s.description = <<-DESC
  					a simple wap to use pinyin with swift. 
  					support strip combining marks、strip whitespace... with option
                   DESC

  s.homepage  = "https://github.com/CrazyFanFan/K3Pinyin/"
  s.license   = "MIT"
  s.author    = { "Crazy凡" => "kongkk@fxiaoke.com" }
  s.platform  = :ios, "8.0"
  s.source    = { :git => "https://github.com/CrazyFanFan/K3Pinyin.git", :tag => "#{s.version}" }
  s.source_files  = "K3Pinyin/*"
  s.requires_arc  = true
  s.static_framework  =  true
end
