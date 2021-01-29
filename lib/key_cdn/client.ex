defmodule KeyCDN.Client do
  @moduledoc false

  @api_endpoint "https://api.keycdn.com"

  def new(api_key) do
    middleware = [
      {Tesla.Middleware.BaseUrl, @api_endpoint},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.BasicAuth, username: api_key, password: ""}
    ]

    Tesla.client(middleware)
  end

  def get(client, uri_path, query_params \\ %{}) do
    client
    |> perform_request(method: :get, url: uri_path, query: query_params)
    |> process_response()
  end

  def post(client, uri_path, params) do
    client
    |> perform_request(method: :post, url: uri_path, body: params)
    |> process_response()
  end

  def put(client, uri_path, params) do
    client
    |> perform_request(method: :put, url: uri_path, body: params)
    |> process_response()
  end

  def delete(client, uri_path, params \\ %{}) do
    client
    |> perform_request(method: :delete, url: uri_path, body: params)
    |> process_response()
  end

  defp perform_request(client, opts), do: Tesla.request(client, opts)

  defp process_response({:ok, %Tesla.Env{status: status} = response})
       when status >= 200 and status <= 299 do
    {:ok, response.body}
  end

  defp process_response({:ok, %Tesla.Env{} = response}), do: {:error, response.body}
  defp process_response({:error, _} = error), do: error
end
