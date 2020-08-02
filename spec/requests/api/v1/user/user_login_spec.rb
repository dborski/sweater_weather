require 'rails_helper'

describe 'User Login' do
  it 'User can successfully login and response includes an API key', :vcr do
    user1 = create(:user, email: 'test@email.com', password: 'password')

    body = {
      email: 'test@email.com',
      password: 'password'
    }

    post '/api/v1/sessions', params: body

    logged_in_user = JSON.parse(response.body, symbolize_names: true)

    expect(logged_in_user[:data]).to have_key(:type)
    expect(logged_in_user[:data]).to have_key(:id)
    expect(logged_in_user[:data][:attributes][:email]).to eq(body[:email])
    expect(logged_in_user[:data][:attributes]).to have_key(:api_key)
  end

  it 'User fails to login because email is invalid', :vcr do
    user1 = create(:user, email: 'test@email.com', password: 'password')

    body = {
      email: 'test123@email.com',
      password: 'password'
    }

    post '/api/v1/sessions', params: body

    logged_in_user = JSON.parse(response.body, symbolize_names: true)

    expect(logged_in_user[:status]).to eq(400)
    expect(logged_in_user[:body]).to eq("Credentials Invalid")
  end

  it 'User fails to login because password is invalid', :vcr do
    user1 = create(:user, email: 'test@email.com', password: 'password')

    body = {
      email: 'test@email.com',
      password: 'password123'
    }

    post '/api/v1/sessions', params: body

    logged_in_user = JSON.parse(response.body, symbolize_names: true)

    expect(logged_in_user[:status]).to eq(400)
    expect(logged_in_user[:body]).to eq("Credentials Invalid")
  end
end