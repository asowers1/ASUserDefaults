Pod::Spec.new do |s|
  s.name             = "ASUserDefaults"
  s.version          = "0.2.1"
  s.summary          = "ASUserDefaults is an NSUserDefaults wrapper written for Swift 2.0"
  s.description      = <<-DESC
ASUserDefaults is an NSUserDefaults wrapper written for Swift 2.0.
You may be asking yourself the following question: "why does NSUserDefaults need a wrapper?" 
While NSUserDefaults is already a simple to use API, I found myself still occasionally needing to look up the documentation for it.
What ASUserDefaults aims to do is simplify your NSUserDefaults flow by simply calling a `Save` and `Load` method on the ASUserDefaults shared manager (singleton) class.
Beyond this simplification, ASUserDefaults offers a delegate that notifys delegators of when an object is being saved/loaded and its key.
The ASUserDefaults pod project includes an example project and tests.
Feel free to offer a PR or comment on whether you think this project is useful or not.

Enjoy!
                       DESC

  s.homepage         = "https://github.com/asowers1/ASUserDefaults"
  s.license          = 'MIT'
  s.author           = { "asowers1" => "asow123@gmail.com" }
  s.source           = { :git => "https://github.com/asowers1/ASUserDefaults.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/andrewsowers'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ASUserDefaults' => ['Pod/Assets/*.png']
  }

end
