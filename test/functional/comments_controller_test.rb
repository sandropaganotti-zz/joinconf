require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Rails.application.routes.url_helpers
  
  setup do
     default_url_options[:host] = 'test.host'
  end
  
  test "come ur voglio poter commentare una conferenza" do
    sign_in users(:sandro)
    request.env["HTTP_REFERER"] = url_for(:controller => 'conferences', :action => 'show', :id => conferences(:mix11).id)
    post :create, { :conference_id => conferences(:mix11).id, :comment => {
        :text => "This was the first user group meeting I attended. I hope they are all this fun because I will try to be there again next time! Thanks for making this happen!"
      }}
    assert_not_nil assigns(:comment)
    assert_redirected_to :controller => 'conferences', :action => 'show', :id => conferences(:mix11).id
    assert_equal "Thank you, comment successfully posted", flash[:notice]
  end

  test "come ur voglio poter commentare una presentazione" do
    sign_in users(:sandro)
    request.env["HTTP_REFERER"] = url_for(:controller => 'sessions', :action => 'show', :conference_id => conferences(:mix11).id ,:id => sessions(:cloud).id)
    post :create, { :conference_id => conferences(:mix11).id, :session_id => sessions(:cloud).id, :comment => {
        :text => "This was the first user group meeting I attended. I hope they are all this fun because I will try to be there again next time! Thanks for making this happen!"
      }}
    assert_not_nil assigns(:comment)
    assert_redirected_to :controller => 'sessions', :action => 'show', :conference_id => conferences(:mix11).id ,:id => sessions(:cloud).id
    assert_equal "Thank you, comment successfully posted", flash[:notice]
  end
  
  test "come ua voglio poter vedere l'elenco dei commenti fatti su una conferenza" do
    get :index, {:conference_id => conferences(:mix11)}
    assert_not_nil assigns(:comments)
    assert_select "form", 1
    assert_select "section article.comment", assigns(:comments).size
  end

  test "come ua voglio poter vedere l'elenco dei commenti fatti su una sessione" do
    get :index, {:conference_id => conferences(:mix11), :session_id => sessions(:jquery)}
    assert_not_nil assigns(:comments)
    assert_select "form", 1
    assert_select "section article.comment", assigns(:comments).size
  end


  
end
