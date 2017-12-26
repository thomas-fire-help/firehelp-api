require 'test_helper'

class VolunteersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @volunteer = volunteers(:one)
  end

  test "should get index" do
    get volunteers_url, as: :json
    assert_response :success
  end

  test "should create volunteer" do
    assert_difference('Volunteer.count') do
      post volunteers_url, params: { volunteer: { additional_information: @volunteer.additional_information, address: @volunteer.address, contact_name: @volunteer.contact_name, coordinates: @volunteer.coordinates, email_address: @volunteer.email_address, number_of_volunteers: @volunteer.number_of_volunteers, organization: @volunteer.organization, phone_number: @volunteer.phone_number, skills: @volunteer.skills, status: @volunteer.status, user_id: @volunteer.user_id, verified: @volunteer.verified, volunteers_notes: @volunteer.volunteers_notes } }, as: :json
    end

    assert_response 201
  end

  test "should show volunteer" do
    get volunteer_url(@volunteer), as: :json
    assert_response :success
  end

  test "should update volunteer" do
    patch volunteer_url(@volunteer), params: { volunteer: { additional_information: @volunteer.additional_information, address: @volunteer.address, contact_name: @volunteer.contact_name, coordinates: @volunteer.coordinates, email_address: @volunteer.email_address, number_of_volunteers: @volunteer.number_of_volunteers, organization: @volunteer.organization, phone_number: @volunteer.phone_number, skills: @volunteer.skills, status: @volunteer.status, user_id: @volunteer.user_id, verified: @volunteer.verified, volunteers_notes: @volunteer.volunteers_notes } }, as: :json
    assert_response 200
  end

  test "should destroy volunteer" do
    assert_difference('Volunteer.count', -1) do
      delete volunteer_url(@volunteer), as: :json
    end

    assert_response 204
  end
end
