require 'rails_helper'

describe 'User Registration' do
  it 'Successfully creates a new user along with a unique api key', :vcr do
    body = { 
      email: 'test@email.com',
      password: 'password',
      password_confirmation: 'password',
    }

    post '/api/v1/users', params: body

    new_user = JSON.parse(response.body, symbolize_names: true)

    expect(new_user[:data]).to have_key(:type)
    expect(new_user[:data]).to have_key(:id)
    expect(new_user[:data][:attributes][:email]).to eq(body[:email])
    expect(new_user[:data][:attributes]).to have_key(:api_key)
  end

  it 'Fails to create a new user because email isnt unique', :vcr do
    user1 = create(:user, email: 'test1@email.com')

    body = { 
      email: 'test1@email.com',
      password: 'password',
      password_confirmation: 'password',
    }

    post '/api/v1/users', params: body

    new_user = JSON.parse(response.body, symbolize_names: true)

    expect(new_user[:status]).to eq(400)
    expect(new_user[:body]).to eq("Email has already been taken")
  end

  it 'Fails to create a new user because passwords dont match', :vcr do
    user1 = create(:user, email: 'test1@email.com')

    body = { 
      email: 'test@email.com',
      password: 'password',
      password_confirmation: 'password1',
    }

    post '/api/v1/users', params: body

    new_user = JSON.parse(response.body, symbolize_names: true)

    expect(new_user[:status]).to eq(400)
    expect(new_user[:body]).to eq("Password confirmation doesn't match Password and Password confirmation doesn't match Password")
  end

  it 'Fails to create a new user because email is missing', :vcr do
    body = { 
      email: '',
      password: 'password1',
      password_confirmation: 'password1',
    }

    post '/api/v1/users', params: body

    new_user = JSON.parse(response.body, symbolize_names: true)

    expect(new_user[:status]).to eq(400)
    expect(new_user[:body]).to eq("Email can't be blank")
  end

  it 'Fails to create a new user because password is missing', :vcr do
    body = { 
      email: 'test@email.com',
      password: '',
      password_confirmation: 'password1',
    }

    post '/api/v1/users', params: body

    new_user = JSON.parse(response.body, symbolize_names: true)

    expect(new_user[:status]).to eq(400)
    expect(new_user[:body]).to eq("Password can't be blank, Password can't be blank, and Password confirmation doesn't match Password")
  end
end