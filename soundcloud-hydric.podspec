Pod::Spec.new do |s|
  	s.name = 'soundcloud-hydric'
	  s.summary = 'Hydric fork of the Soundcloud Cocoa API.'
  	s.version = '1.1.1'
  	s.license = { :type => 'propietary', :text => 'https://developers.soundcloud.com/docs/api/terms-of-use' }
  	s.author = 'SoundCloud'
  	s.homepage = 'https://developers.soundcloud.com/docs/api/ios-quickstart'
	
  	s.source = { :git => 'https://github.com/hydricmedia/SoundCloud-Cocoa-API.git', :tag => s.version.to_s }

  	s.ios.deployment_target = '8.0'
  
  	s.source_files = 'Sources', 'Sources/**/*.{h,m}'
 
  	s.framework = 'Security'
  	s.dependency 'NXOAuth2Client', '~> 1.2.2'
  
  	s.requires_arc = true
end
