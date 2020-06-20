module Sshhh
  class Storage
    PASSWORDS = {}
    private_constant :PASSWORDS

    def self.list
      PASSWORDS.keys
    end

    def self.store(key, password)
      PASSWORDS[key] = password
    end

    def self.remove(key)
      PASSWORDS.delete(key)
    end

    def self.retrieve(key)
      PASSWORDS[key]
    end

    def self.clear!
      PASSWORDS.clear
    end
  end
end
