require 'test_helper'

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animal = animals(:one)
  end

  test "should get index" do
    get animals_url, as: :json
    assert_response :success
  end

  test "should create animal" do
    assert_difference('Animal.count') do
      post animals_url, params: { animal: { additional_information: @animal.additional_information, city: @animal.city, contact_name: @animal.contact_name, email_address: @animal.email_address, help_offered: @animal.help_offered, organization: @animal.organization, phone_number: @animal.phone_number, status: @animal.status, type_of_animal: @animal.type_of_animal, user_id: @animal.user_id, verified: @animal.verified } }, as: :json
    end

    assert_response 201
  end

  test "should show animal" do
    get animal_url(@animal), as: :json
    assert_response :success
  end

  test "should update animal" do
    patch animal_url(@animal), params: { animal: { additional_information: @animal.additional_information, city: @animal.city, contact_name: @animal.contact_name, email_address: @animal.email_address, help_offered: @animal.help_offered, organization: @animal.organization, phone_number: @animal.phone_number, status: @animal.status, type_of_animal: @animal.type_of_animal, user_id: @animal.user_id, verified: @animal.verified } }, as: :json
    assert_response 200
  end

  test "should destroy animal" do
    assert_difference('Animal.count', -1) do
      delete animal_url(@animal), as: :json
    end

    assert_response 204
  end
end
