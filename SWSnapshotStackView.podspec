Pod::Spec.new do |s|
  s.name         = 'SWSnapshotStackView'
  s.version      = '1.0.0'
  s.summary      = 'Snapshot Stack View cocoa touch class decorates your UIImage\'s for presentation to the user with matte border, drop shadows and simulated stack of physical photos.'
  s.homepage     = 'https://github.com/djbe/SWSnapshotStackView'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = 'constantineSafronov'
  
  s.source       = { :git => 'https://github.com/djbe/SWSnapshotStackView.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '5.1.1'
  s.source_files = 'SWSnapshotStackView.{h,m}'
  
  s.requires_arc = true
end
