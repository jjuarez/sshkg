module SSHKeyGenerator  
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 2

    STRING = [MAJOR, MINOR, PATCH ].compact.join(".")
  end

  NAME    = "sshkg"
  VERSION = Version::STRING
end