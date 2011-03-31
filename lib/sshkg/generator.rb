require 'rubygems'
require 'config_context'


module SSHKeyGenerator
  extend self
  
  DEFAULT_TYPE    = :dsa
  DEFAULT_BITS    = 1024
  DEFAULT_COMMENT = "example.com"
  
  def generate( atts = { } )

    raise ArgumentError.new( "There is an argument problem" ) if atts.empty?
    raise ArgumentError.new( "You need an user id" ) unless atts[:user]
    
    user    = atts[:user]
    type    = atts[:type] ? atts[:type] : DEFAULT_TYPE    
    bits    = atts[:bits] ? atts[:bits] : DEFAULT_BITS
    comment = atts[:comment] ? atts[:comment] : DEFAULT_COMMENT

    %x{ssh-keygen -q -b #{bits} -t #{type} -f id_#{type}.#{user} -C #{user}@#{comment} 2>/dev/null </dev/null}
  end
end