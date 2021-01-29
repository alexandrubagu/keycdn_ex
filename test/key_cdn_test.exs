defmodule KeyCDNTest do
  use ExUnit.Case

  import Tesla.Mock

  alias KeyCDN.Client

  setup _, do: {:ok, client: Client.new("some_api_key")}

  test "list_zones", %{client: client} do
    mock(fn
      %{method: :get, url: "https://api.keycdn.com/zones.json"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.list_zones(client)
  end

  test "view_zone", %{client: client} do
    mock(fn
      %{method: :get, url: "https://api.keycdn.com/zones/1.json"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.view_zone(client, _zone_id = 1)
  end

  test "add_zone", %{client: client} do
    mock(fn
      %{method: :post, url: "https://api.keycdn.com/zones.json", body: "{\"param\":1}"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.add_zone(client, %{param: 1})
  end

  test "edit_zone", %{client: client} do
    mock(fn
      %{method: :put, url: "https://api.keycdn.com/zones/1.json", body: "{\"param\":1}"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.edit_zone(client, _zone_id = 1, %{param: 1})
  end

  test "delete_zone", %{client: client} do
    mock(fn
      %{method: :delete, url: "https://api.keycdn.com/zones/1.json"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.delete_zone(client, _zone_id = 1)
  end

  test "purge_zone_cache", %{client: client} do
    mock(fn
      %{method: :get, url: "https://api.keycdn.com/zones/purge/1.json"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.purge_zone_cache(client, _zone_id = 1)
  end

  test "purge_zone_url", %{client: client} do
    mock(fn
      %{method: :delete, url: "https://api.keycdn.com/zones/purgeurl/1.json", body: body} ->
        assert body == "{\"urls\":[\"example.com/image.png\",\"example.com/style.css\"]}"
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} =
             KeyCDN.purge_zone_url(
               client,
               _zone_id = 1,
               _urls = [
                 "example.com/image.png",
                 "example.com/style.css"
               ]
             )
  end

  test "list_zone_aliases", %{client: client} do
    mock(fn
      %{method: :get, url: "https://api.keycdn.com/zonealiases.json"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.list_zone_aliases(client)
  end

  test "add_zone_aliases", %{client: client} do
    mock(fn
      %{method: :post, url: "https://api.keycdn.com/zonealiases.json", body: "{\"param\":1}"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.add_zone_aliases(client, %{param: 1})
  end

  test "edit_zone_aliases", %{client: client} do
    mock(fn
      %{method: :put, url: "https://api.keycdn.com/zonealiases.json", body: "{\"param\":1}"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.edit_zone_aliases(client, %{param: 1})
  end

  test "delete_zone_aliases", %{client: client} do
    mock(fn
      %{method: :delete, url: "https://api.keycdn.com/zonealiases/1.json"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.delete_zone_aliases(client, _zonealias_id = 1)
  end

  test "list_zone_referrers", %{client: client} do
    mock(fn
      %{method: :get, url: "https://api.keycdn.com/zonereferrers.json"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.list_zone_referrers(client)
  end

  test "add_zone_referrers", %{client: client} do
    mock(fn
      %{method: :post, url: "https://api.keycdn.com/zonereferrers.json", body: "{\"param\":1}"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.add_zone_referrers(client, %{param: 1})
  end

  test "edit_zone_referrers", %{client: client} do
    mock(fn
      %{method: :put, url: "https://api.keycdn.com/zonereferrers/1.json", body: "{\"param\":1}"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.edit_zone_referrers(client, _zonereferrer_id = 1, %{param: 1})
  end

  test "delete_zone_referrers", %{client: client} do
    mock(fn
      %{method: :delete, url: "https://api.keycdn.com/zonereferrers/1.json"} ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.delete_zone_referrers(client, _zonereferrer_id = 1)
  end

  # "/reports/traffic.json"
  # "/reports/storage.json"
  # "/reports/ip.json"
  # "/reports/statestats.json"
  # "/reports/credits.json"
  # "/reports/creditbalance.json"

  test "traffic_statistics", %{client: client} do
    mock(fn
      %{
        method: :get,
        url: "https://api.keycdn.com/reports/traffic.json",
        query: %{end: 2, start: 1}
      } ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.traffic_statistics(client, %{start: 1, end: 2})
  end

  test "storage_statistics", %{client: client} do
    mock(fn
      %{
        method: :get,
        url: "https://api.keycdn.com/reports/storage.json",
        query: %{end: 2, start: 1}
      } ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.storage_statistics(client, %{start: 1, end: 2})
  end

  test "image_processing_statistics", %{client: client} do
    mock(fn
      %{
        method: :get,
        url: "https://api.keycdn.com/reports/ip.json",
        query: %{end: 2, start: 1}
      } ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.image_processing_statistics(client, %{start: 1, end: 2})
  end

  test "status_statistics", %{client: client} do
    mock(fn
      %{
        method: :get,
        url: "https://api.keycdn.com/reports/statestats.json",
        query: %{end: 2, start: 1}
      } ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.status_statistics(client, %{start: 1, end: 2})
  end

  test "credits_statistics", %{client: client} do
    mock(fn
      %{
        method: :get,
        url: "https://api.keycdn.com/reports/credits.json",
        query: %{end: 2, start: 1}
      } ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.credits_statistics(client, %{start: 1, end: 2})
  end

  test "credit_balance", %{client: client} do
    mock(fn
      %{
        method: :get,
        url: "https://api.keycdn.com/reports/creditbalance.json"
      } ->
        %Tesla.Env{status: 200, body: :succeed}
    end)

    assert {:ok, :succeed} = KeyCDN.credit_balance(client)
  end
end
