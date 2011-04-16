require 'test_helper'

class AttendeesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "come utente registrato voglio poter aderire ad una conferenza" do
    sign_in users(:sandro)
    post :create, :conference_id => conferences(:whymca)
    assert_redirected_to :controller => "conferences", :action => "show", :id => conferences(:whymca).id
    assert_equal "You succesfully joined #{conferences(:whymca).name}", flash[:notice]
  end  

end
