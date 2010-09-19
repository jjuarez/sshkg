module SSHKeyGenerator
  
  SSHKeyGenerator::SSH_KEYGEN  = "/usr/bin/ssh-keygen"

  def self.generate( )
    
    kopts = Config.options
    `#{SSHKeyGenerator::SSH_KEYGEN} -t #{kopts[:type]} -f #{kopts[:file]} -C "#{kopts[:comment]}" 2>/dev/null </dev/null`
  end
end
