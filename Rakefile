require 'rubygems'
require File.dirname( __FILE__ ) + "/lib/sshkg/version.rb"

begin
  require 'jeweler'

  Jeweler::Tasks.new do |gemspec|

    gemspec.name          = SSHKeyGenerator::NAME
    gemspec.version       = SSHKeyGenerator::VERSION
    gemspec.summary       = "A very simple gem that helps to automate the generation of SSH Keys"
    gemspec.description   = "A wrapper over ssh-keygem for rubyists"
    gemspec.email         = "javier.juarez@gmail.com"
    gemspec.homepage      = "http://github.com/jjuarez/#{SSHKeyGenerator::NAME}"
    gemspec.authors       = ["Javier Juarez"]

    gemspec.files         = Dir['lib/**/*.rb'] + Dir['bin/*']
  end
  
  Jeweler::GemcutterTasks.new

rescue LoadError
  $stderr.puts "Jeweler not available. Install it with: gem install jeweler"
end


task :clean do

  sh "rm -fr ./pkg 2>/dev/null"
  sh "rm -f *.gemspec 2>/dev/null"
end
