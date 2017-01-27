require 'test_helper'

class FactoidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factoid = factoids(:one)
  end

  test "should get index" do
    get factoids_url
    assert_response :success
  end

  test "should get new" do
    get new_factoid_url
    assert_response :success
  end

  test "should create factoid" do
    assert_difference('Factoid.count') do
      post factoids_url, params: { factoid: { text: @factoid.text } }
    end

    assert_redirected_to factoid_url(Factoid.last)
  end

  test "should show factoid" do
    get factoid_url(@factoid)
    assert_response :success
  end

  test "should get edit" do
    get edit_factoid_url(@factoid)
    assert_response :success
  end

  test "should update factoid" do
    patch factoid_url(@factoid), params: { factoid: { text: @factoid.text } }
    assert_redirected_to factoid_url(@factoid)
  end

  test "should destroy factoid" do
    assert_difference('Factoid.count', -1) do
      delete factoid_url(@factoid)
    end

    assert_redirected_to factoids_url
  end
end
