class TodoApi < Sinatra::Base

  get "/" do
    {hello: :world}.to_json
  end

  get '/todos' do
    $db.join("\n")
  end
  post '/todo' do
    return 400 unless params["todo"].present?

    $db << params["todo"]
    200
  end

end
