require 'test_helper'

class HousingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @housing = housings(:one)
  end

  test "should get index" do
    get housings_url, as: :json
    assert_response :success
  end

  test "should create housing" do
    assert_difference('Housing.count') do
      post housings_url, params: { housing: { beds: @housing.beds, child_friendly: @housing.child_friendly, city: @housing.city, contact_name: @housing.contact_name, email_address: @housing.email_address, kid_notes: @housing.kid_notes, length_of_stay: @housing.length_of_stay, notes: @housing.notes, pet_notes: @housing.pet_notes, pets_accepted: @housing.pets_accepted, phone_number: @housing.phone_number, status: @housing.status, user_id: @housing.user_id, verified: @housing.verified } }, as: :json
    end

    assert_response 201
  end

  test "should show housing" do
    get housing_url(@housing), as: :json
    assert_response :success
  end

  test "should update housing" do
    patch housing_url(@housing), params: { housing: { beds: @housing.beds, child_friendly: @housing.child_friendly, city: @housing.city, contact_name: @housing.contact_name, email_address: @housing.email_address, kid_notes: @housing.kid_notes, length_of_stay: @housing.length_of_stay, notes: @housing.notes, pet_notes: @housing.pet_notes, pets_accepted: @housing.pets_accepted, phone_number: @housing.phone_number, status: @housing.status, user_id: @housing.user_id, verified: @housing.verified } }, as: :json
    assert_response 200
  end

  test "should destroy housing" do
    assert_difference('Housing.count', -1) do
      delete housing_url(@housing), as: :json
    end

    assert_response 204
  end
end
