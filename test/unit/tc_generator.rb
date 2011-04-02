$:.unshift( File.join( File.dirname( __FILE__ ), %w[.. .. lib sshkg] ) )


require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fileutils'
require 'generator'


class TestSSHKeyGenerator < Test::Unit::TestCase

  context "A SSH key generator context" do

    setup do
      
      @test_dsa_user                 = "dsauser"
      @test_dsa_comment              = "dsacomment"
      @test_dsa_key_file_name        = "id_dsa.#{@test_dsa_user}"
      @test_dsa_public_key_file_name = "id_dsa.#{@test_dsa_user}.pub"

      @test_rsa_user                 = "rsauser"
      @test_rsa_comment              = "rsacomment"
      @test_rsa_key_file_name        = "id_rsa.#{@test_rsa_user}"
      @test_rsa_public_key_file_name = "id_rsa.#{@test_rsa_user}.pub"
    end
    
    
    teardown do
      
      FileUtils.rm_f( @test_dsa_key_file_name )
      FileUtils.rm_f( @test_dsa_public_key_file_name )
      
      FileUtils.rm_f( @test_rsa_key_file_name )
      FileUtils.rm_f( @test_rsa_public_key_file_name )
    end
    
    
    should "raise an ArgumentError" do
            
      assert_raises( ArgumentError ) { SSHKeyGenerator.generate( ) } 
      assert_raises( ArgumentError ) { SSHKeyGenerator.generate( :type=>:dsa, :comment=>@test_dsa_comment ) } 
      assert_raises( ArgumentError ) { SSHKeyGenerator.generate( :type=>:rsa, :comment=>@test_rsa_comment ) } 
    end


    should "generate a default key" do
            
      SSHKeyGenerator.generate( :user=>@test_dsa_user )
      
      assert( File.exist?( @test_dsa_key_file_name ) )
      assert( File.read( @test_dsa_key_file_name ).delete( "\n") =~/^-----BEGIN DSA PRIVATE KEY-----(.+)-----END DSA PRIVATE KEY-----$/ )

      assert( File.exist?( @test_dsa_public_key_file_name ) ) 
      assert( File.read( @test_dsa_public_key_file_name ) =~ /^ssh-dss (.+) #{@test_dsa_user}\@example.com$/ )
      
      FileUtils.rm_f( @test_dsa_key_file_name )
      FileUtils.rm_f( @test_dsa_public_key_file_name )
    end


    should "generate a pair of DSA keys" do
      
      SSHKeyGenerator.generate( :user=>@test_dsa_user, :type=>:dsa, :bits=>1024, :comment=>@test_dsa_comment )

      assert( File.exist?( @test_dsa_key_file_name ) )
      assert( File.read( @test_dsa_key_file_name ).delete( "\n") =~/^-----BEGIN DSA PRIVATE KEY-----(.+)-----END DSA PRIVATE KEY-----$/ )

      assert( File.exist?( @test_dsa_public_key_file_name ) )
      assert( File.read( @test_dsa_public_key_file_name ) =~ /^ssh-dss (.+) #{@test_dsa_user}\@#{@test_dsa_comment}$/ )
    end

    
    should "generate a pair of RSA keys" do
    
      SSHKeyGenerator.generate( :user=>@test_rsa_user, :type=>:rsa, :bits=>2048, :comment=>@test_rsa_comment )  

      assert( File.exist?( @test_rsa_key_file_name ) )
      assert( File.read( @test_rsa_key_file_name ).delete( "\n") =~/^-----BEGIN RSA PRIVATE KEY-----(.+)-----END RSA PRIVATE KEY-----$/ )

      assert( File.exist?( @test_rsa_public_key_file_name ) )
      assert( File.read( @test_rsa_public_key_file_name ) =~ /ssh-rsa (.+) #{@test_rsa_user}\@#{@test_rsa_comment}$/ )
    end
  end
end