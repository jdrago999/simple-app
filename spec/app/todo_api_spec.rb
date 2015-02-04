require "spec_helper"

RSpec.describe TodoApi do

  def app
    TodoApi
  end

  def assert_json_eq(string, data)
    expect(JSON.parse(string)).to eq JSON.parse(data.to_json)
  end

  describe 'GET /' do
    context 'happy' do
      it 'returns the expected result' do
        get '/'
        data = {hello: :world}.to_json
        expect(last_response.body).to be_json_eql(data)
      end
    end
  end

  describe "GET todos" do
    context "no todos" do
      it "returns no todos" do
        get "/todos"

        expect(last_response.body).to eq("")
        expect(last_response.status).to eq 200
      end
    end

    context "several todos" do
      before do
        @todos = ["hello", "world", "!"]
        $db = @todos
      end

      it "returns all the todos" do
        get "/todos"

        expect(last_response.body).to eq @todos.join("\n")
        expect(last_response.status).to eq 200
      end
    end
  end

  describe "POST todo" do
    it "returns status 200" do
      post "/todo", :todo => "hello rspec"

      expect(last_response.status).to eq 200
    end

    context "todo param missing" do
      it "returns status 400" do
        post "/todo"

        expect(last_response.status).to eq 400
      end
    end
  end

end
