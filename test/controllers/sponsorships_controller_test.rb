require 'test_helper'

class SponsorshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sponsorship = sponsorships(:one)
  end

  test "should get index" do
    get sponsorships_url
    assert_response :success
  end

  test "should get new" do
    get new_sponsorship_url
    assert_response :success
  end

  test "should create sponsorship" do
    assert_difference('Sponsorship.count') do
      post sponsorships_url, params: { sponsorship: {  } }
    end

    assert_redirected_to sponsorship_url(Sponsorship.last)
  end

  test "should show sponsorship" do
    get sponsorship_url(@sponsorship)
    assert_response :success
  end

  test "should get edit" do
    get edit_sponsorship_url(@sponsorship)
    assert_response :success
  end

  test "should update sponsorship" do
    patch sponsorship_url(@sponsorship), params: { sponsorship: {  } }
    assert_redirected_to sponsorship_url(@sponsorship)
  end

  test "should destroy sponsorship" do
    assert_difference('Sponsorship.count', -1) do
      delete sponsorship_url(@sponsorship)
    end

    assert_redirected_to sponsorships_url
  end
end
