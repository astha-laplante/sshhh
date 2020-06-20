require 'test_helper'

module Sshhh
  class PasswordTest < Minitest::Test

    def setup
      @key = "web"
      @password_str = "123"
      @password = Password.new(@key, @password_str)
    end

    def test_create_password
      password = Storage.retrieve(@key)
      assert_equal @password.inspect, password
    end

    def test_update_password
      @password.update("456")
      assert_equal "456", @password.inspect
    end

    def test_delete_password
      @password.delete
      assert_nil Storage.retrieve(@key)
    end

    def test_inspect
      assert_equal "123", @password.inspect
    end

  end
end
