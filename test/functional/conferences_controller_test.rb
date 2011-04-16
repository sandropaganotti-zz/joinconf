require 'test_helper'

class ConferencesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "come utente anonimo voglio poter vedere l'elenco delle conferenze ordinate per data decrescente" do
    get :index
    assert_not_nil assigns(:conferences); 
    assert_equal assigns(:conferences), Conference.all(:order => 'start DESC'), 'conference list is not correctly ordered'  
    assert_select 'section article.conference', :count => Conference.count
  end

  test "propedeutico a: come utente registrato voglio poter aderire ad una conferenza" do
    get :show, :id => conferences(:mix11).id
    assert_equal assigns(:conference),  conferences(:mix11); 
    assert_select 'article.conference h1', conferences(:mix11).name 
  end
  
end

