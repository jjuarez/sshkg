$:.unshift( File.join( File.dirname( __FILE__ ), %w[.. .. lib] ) )


require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'generator'


class TestSSHKeyGenerator < Test::Unit::TestCase

  context "A SSH key generator context" do

    setup do
      
      dsa_key_config_file = File.join( File.dirname( __FILE__, %w[.. fixtures dsa.yml] ) ) 
      rsa_key_config_file = File.join( File.dirname( __FILE__, %w[.. fixtures rsa.yml] ) )
    end
    
    should "generate a pair of DSA keys" do
      
      SSHKeyGenerator.generate
    
    end

    should "generate a pair of RSA keys" do
    
    end
  end
end