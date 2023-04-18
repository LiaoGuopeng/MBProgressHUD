Pod::Spec.new do |s|
  s.name         = "LGPProgressHUD"
  s.version      = "2.0.0"
  s.summary      = "An iOS activity indicator view."
  s.description  = <<-DESC
                    MBProgressHUD is an iOS drop-in class that displays a translucent HUD
                    with an indicator and/or labels while work is being done in a background thread.
                    The HUD is meant as a replacement for the undocumented, private UIKit UIProgressHUD
                    with some additional features.
                   DESC
  s.homepage     = "http://www.bukovinski.com"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { 'LIAOGUOPENG' => '756581014@qq.com' }
  s.platform     = :ios, '11.0'
  s.source       = { :git => "https://github.com/LiaoGuopeng/MBProgressHUD.git", :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = '*.{h,m}'
  s.resource = '*.bundle'
  s.frameworks   = "CoreGraphics", "QuartzCore"
  s.requires_arc = true
end
