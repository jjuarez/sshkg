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
      
      def options()
        { :type    =>Config[:type], 
          :file    =>"id_#{Config[:type]}.#{Config[:user]}", 
          :comment =>"#{Config[:user]}@#{Config[:comment]}" } if @config
      end
    end
  end
end
