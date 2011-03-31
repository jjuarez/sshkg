$:.unshift( File.join( File.dirname( __FILE__ ), %w[lib sshkg] ) )

begin
  require 'rubygems'
  require 'jeweler'
  require 'fileutils'

  require 'version'
  
rescue LoadError=>le
  fail( le.message )
end


desc "Cleans all temporary items"
task :clean do
  begin
    
    [ './tmp', './pkg' ].each { |dir| FileUtils.remove_dir( dir, true ) }
  rescue LoadError => le
    fail( le.message )
  end
end


desc "Build the gem"
task :build =>[:clean] do
  begin
    require 'jeweler'
  rescue LoadError => e
    fail( "Jeweler not available. Install it with: gem install jeweler" )
  end

  Jeweler::Tasks.new do |gemspec|

    gemspec.name              = SSHKeyGenerator::Version::NAME
    gemspec.version           = SSHKeyGenerator::Version::VERSION
    gemspec.rubyforge_project = "http://github.com/jjuarez/#{SSHKeyGenerator::Version::NAME}"
    gemspec.summary           = "A very simple gem that helps to automate the generation of SSH Keys"
    gemspec.description       = "A wrapper over ssh-keygem for rubyists"
    gemspec.email             = 'javier.juarez@gmail.com'
    gemspec.homepage          = "http://github.com/jjuarez/#{SSHKeyGenerator::Version::NAME}"
    gemspec.authors           = ['Javier Juarez']
    gemspec.files             = Dir['bin/*'] + Dir[ 'lib/**/*.rb' ] + Dir[ 'test/**/*rb' ]
    gemspec.executables       = ['sshkg']
 
    gemspec.add_dependency( 'choice' )
    gemspec.add_dependency( 'config_context' )
  end

  Jeweler::GemcutterTasks.new
end


desc "Testing!!!"
task :test do
  require 'rake/runtest'

  Rake.run_tests 'test/unit/tc_*.rb'
end


task :default=>[:build]