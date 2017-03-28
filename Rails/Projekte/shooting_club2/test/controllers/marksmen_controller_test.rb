require 'test_helper'

class MarksmenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marksman = marksmen(:one)
  end

  test "should get index" do
    get marksmen_url
    assert_response :success
  end

  test "should get new" do
    get new_marksman_url
    assert_response :success
  end

  test "should create marksman" do
    assert_difference('Marksman.count') do
      post marksmen_url, params: { marksman: { firstname: @marksman.firstname, location: @marksman.location, startnr: @marksman.startnr, surname: @marksman.surname } }
    end

    assert_redirected_to marksman_url(Marksman.last)
  end

  test "should show marksman" do
    get marksman_url(@marksman)
    assert_response :success
  end

  test "should get edit" do
    get edit_marksman_url(@marksman)
    assert_response :success
  end

  test "should update marksman" do
    patch marksman_url(@marksman), params: { marksman: { firstname: @marksman.firstname, location: @marksman.location, startnr: @marksman.startnr, surname: @marksman.surname } }
    assert_redirected_to marksman_url(@marksman)
  end

  test "should destroy marksman" do
    assert_difference('Marksman.count', -1) do
      delete marksman_url(@marksman)
    end

    assert_redirected_to marksmen_url
  end
end
