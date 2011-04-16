require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "come utente anonimo voglio poter vedere l'elenco delle presentazioni di una conferenza ordinate in data crescente" do 
    view_sessions
  end
  
  test "come utente registrato voglio poter vedere l'elenco delle presentazioni di una conferenza ordinate in data crescente" do 
    sign_in users(:sandro)
    view_sessions
  end
  
  test "come utente anonimo voglio porer vedere il dettaglio di una presenzatione" do 
    view_session_detail
  end

  test "come utente registrato voglio porer vedere il dettaglio di una presenzatione" do 
    sign_in users(:sandro)
    view_session_detail
  end
  
  private
  
  def view_sessions
    get :index, {:conference_id => conferences(:mix11).id}
    assert_not_nil assigns(:sessions);
    assert_select "section article.session", Conference.find(Fixtures.identify(:mix11)).sessions.count    
  end
  
  def view_session_detail
    get :show, {:conference_id => conferences(:mix11).id, :id => sessions(:jquery).id}
    assert_equal assigns(:session), sessions(:jquery)
    assert_select "article.session h1", sessions(:jquery).name    
  end
  
end
