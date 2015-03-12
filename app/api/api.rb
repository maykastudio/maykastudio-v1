class Api < Grape::API
  format :json
  prefix :api

  get :ping do
    'pong'
  end
end
