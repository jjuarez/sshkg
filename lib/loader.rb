require 'rubygems'

$:.unshift( File.join( File.dirname( __FILE__ ), 'sshkg' ) )

begin
  Dir.glob( File.join( File.dirname( __FILE__ ), "**", "*.rb" ) ).each do |library| 

    require library    
  end  
rescue LoadError => le
  MiniLogger.error( le.message )
end