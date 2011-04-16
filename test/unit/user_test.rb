require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "already_joined controlla se hai gia joinato una conf" do
    assert users(:sandro).already_joined?(conferences(:mix11))
    assert !users(:sandro).already_joined?(conferences(:whymca))
  end

end
