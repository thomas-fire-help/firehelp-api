require 'test_helper'

class SuppliesNeededsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supplies_needed = supplies_neededs(:one)
  end

  test "should get index" do
    get supplies_neededs_url, as: :json
    assert_response :success
  end

  test "should create supplies_needed" do
    assert_difference('SuppliesNeeded.count') do
      post supplies_neededs_url, params: { supplies_needed: { direct_donations: @supplies_needed.direct_donations, drop_off_hours: @supplies_needed.drop_off_hours, drop_off_location: @supplies_needed.drop_off_location, email_address: @supplies_needed.email_address, items: @supplies_needed.items, organization: @supplies_needed.organization, phone_number: @supplies_needed.phone_number, special_instructions: @supplies_needed.special_instructions } }, as: :json
    end

    assert_response 201
  end

  test "should show supplies_needed" do
    get supplies_needed_url(@supplies_needed), as: :json
    assert_response :success
  end

  test "should update supplies_needed" do
    patch supplies_needed_url(@supplies_needed), params: { supplies_needed: { direct_donations: @supplies_needed.direct_donations, drop_off_hours: @supplies_needed.drop_off_hours, drop_off_location: @supplies_needed.drop_off_location, email_address: @supplies_needed.email_address, items: @supplies_needed.items, organization: @supplies_needed.organization, phone_number: @supplies_needed.phone_number, special_instructions: @supplies_needed.special_instructions } }, as: :json
    assert_response 200
  end

  test "should destroy supplies_needed" do
    assert_difference('SuppliesNeeded.count', -1) do
      delete supplies_needed_url(@supplies_needed), as: :json
    end

    assert_response 204
  end
end
