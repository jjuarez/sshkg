module SSHKeyGenerator
  extend self
  
  SSH_KEYGEN = "/usr/bin/ssh-keygen"

  def self.generate( options=Config.to_h )
    
    `#{SSH_KEYGEN} -t #{options[:type]} -f #{options[:file]} -C "#{options[:comment]}" 2>/dev/null </dev/null` if options
  end
end