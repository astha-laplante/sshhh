require_relative "storage"

module Sshhh
  class Password
    def initialize(key, pass)
      @key = key
      @password = pass
      Storage.store(key, password)
    end

    def update(pass)
      @password = pass
      Storage.store(key, password)
    end

    def delete()
      Storage.remove(key)
    end

    def inspect
      password
    end

    private

    attr_reader :key, :password
  end
end
