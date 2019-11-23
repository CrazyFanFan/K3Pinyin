Pod::Spec.new do |s|
  s.name    = "K3Pinyin"
  s.version = "1.0.0"
  s.summary = "a simple wap to use pinyin with swift."

  s.description = <<-DESC
  					a simple wap to use pinyin with swift. 
  					support strip combining marks、strip whitespace... with option
                   DESC

  s.homepage  = "https://github.com/CrazyFanFan/K3Pinyin/"
  s.license   = "MIT"
  s.author    = { "Crazy凡" => "827799383@qq.com" }
  s.platform  = :ios, "8.0"
  s.source    = { :git => "https://github.com/CrazyFanFan/K3Pinyin.git", :tag => "#{s.version}" }
  s.source_files  = "K3Pinyin/**/*.{h,swift}"
  s.requires_arc  = true
  s.swift_version = '5.0'
end
