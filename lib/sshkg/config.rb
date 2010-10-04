require 'yaml'

module SSHKeyGenerator
  
  class Config    
    class << self
      
      def load( user, file_name )
        
        @config        = YAML.load_file( file_name )
        @config[:user] = user 
      end 

      def [] key 
        
        @config[key] ? @config[key] : @config[key.to_s] if @config
      end
      
      def to_h()
        
        hc = Hash.new

        if @config
        
          hc[:type]    = Config[:type]
          hc[:file]    = "id_#{Config[:type]}.#{Config[:user]}"
          hc[:comment] = "#{Config[:user]}@#{Config[:comment]}"
        end
      
        hc
      end
    end
  end
end