require 'test_helper'

module Sshhh
  class StorageTest < Minitest::Test
    def setup
      Storage.clear!
    end

    def test_list
      Storage.store("web", "123")
      Storage.store("app1", "abc")
      assert_equal ["web", "app1"], Storage.list
    end

    def test_store_add_new_password
      Storage.store("app2", "123")
      assert_equal ["app2"], Storage.list
    end

    def test_store_does_not_add_new_entry_for_existing_key
      Storage.store("app2", "123")
      assert_equal ["app2"], Storage.list
      Storage.store("app2", "456")
      assert_equal ["app2"], Storage.list
    end

    def test_store_updates_the_exisitng_password
      Storage.store("app2", "123")
      assert_equal "123", Storage.retrieve("app2")
      Storage.store("app2", "456")
      assert_equal "456", Storage.retrieve("app2")
    end

    def test_remove_password
      Storage.store("app2", "123")
      Storage.remove("app2")
      assert_empty Storage.list
    end
  end
end