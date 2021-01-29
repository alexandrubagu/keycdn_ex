defmodule KeyCDN.ClientTest do
  use ExUnit.Case

  import Tesla.Mock

  alias KeyCDN.Client

  @api_key "some_api_key"

  describe "get/3" do
    test "performs a get request and returns the response body" do
      mock(fn
        %{method: :get, url: "https://api.keycdn.com/test.json", query: %{param: 1}} ->
          %Tesla.Env{status: 200, body: :succeed}
      end)

      assert {:ok, :succeed} =
               @api_key
               |> Client.new()
               |> Client.get(_uri_path = "/test.json", _query_params = %{param: 1})
    end

    test "returns an error if request didn't succeed" do
      mock(fn
        %{method: :get, url: "https://api.keycdn.com/test.json", query: %{param: 1}} ->
          %Tesla.Env{status: 404, body: :not_found}
      end)

      assert {:error, :not_found} =
               @api_key
               |> Client.new()
               |> Client.get(_uri_path = "/test.json", _query_params = %{param: 1})
    end
  end

  describe "post/3" do
    test "performs a post request and returns the response body" do
      mock(fn
        %{method: :post, url: "https://api.keycdn.com/test.json", body: "{\"param\":1}"} ->
          %Tesla.Env{status: 200, body: :succeed}
      end)

      assert {:ok, :succeed} =
               @api_key
               |> Client.new()
               |> Client.post(_uri_path = "/test.json", _body_params = %{param: 1})
    end

    test "returns an error if request didn't succeed" do
      mock(fn
        %{method: :post, url: "https://api.keycdn.com/test.json", body: "{\"param\":1}"} ->
          %Tesla.Env{status: 404, body: :not_found}
      end)

      assert {:error, :not_found} =
               @api_key
               |> Client.new()
               |> Client.post(_uri_path = "/test.json", _body_params = %{param: 1})
    end
  end

  describe "put/3" do
    test "performs a put request and returns the response body" do
      mock(fn
        %{method: :put, url: "https://api.keycdn.com/test.json", body: "{\"param\":1}"} ->
          %Tesla.Env{status: 200, body: :succeed}
      end)

      assert {:ok, :succeed} =
               @api_key
               |> Client.new()
               |> Client.put(_uri_path = "/test.json", _body_params = %{param: 1})
    end

    test "returns an error if request didn't succeed" do
      mock(fn
        %{method: :put, url: "https://api.keycdn.com/test.json", body: "{\"param\":1}"} ->
          %Tesla.Env{status: 404, body: :not_found}
      end)

      assert {:error, :not_found} =
               @api_key
               |> Client.new()
               |> Client.put(_uri_path = "/test.json", _body_params = %{param: 1})
    end
  end

  describe "delete/3" do
    test "performs a delete request and returns the response body" do
      mock(fn
        %{method: :delete, url: "https://api.keycdn.com/test.json", body: "{\"param\":1}"} ->
          %Tesla.Env{status: 200, body: :succeed}
      end)

      assert {:ok, :succeed} =
               @api_key
               |> Client.new()
               |> Client.delete(_uri_path = "/test.json", _body_params = %{param: 1})
    end

    test "returns an error if request didn't succeed" do
      mock(fn
        %{method: :delete, url: "https://api.keycdn.com/test.json", body: "{\"param\":1}"} ->
          %Tesla.Env{status: 404, body: :not_found}
      end)

      assert {:error, :not_found} =
               @api_key
               |> Client.new()
               |> Client.delete(_uri_path = "/test.json", _body_params = %{param: 1})
    end
  end
end
