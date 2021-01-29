defmodule KeyCDN do
  @moduledoc false

  alias KeyCDN.Client

  @doc """
  Returns a list of all Zones on the specified account.
  """
  def list_zones(client), do: Client.get(client, "/zones.json")

  @doc """
  Returns a Zone specified by the {zone_id} parameter.
  """
  def view_zone(client, zone_id), do: Client.get(client, "/zones/#{zone_id}.json")

  @doc """
  Add a new Zone with the specified parameters for the accessing user.
  """
  def add_zone(client, params), do: Client.post(client, "/zones.json", params)

  @doc """
  Edit the given Zone specified by the parameter {zone_id} with the specified request parameters.
  """
  def edit_zone(client, zone_id, params), do: Client.put(client, "/zones/#{zone_id}.json", params)

  @doc """
  Delete the given Zone specified by the parameter {zone_id}.
  """
  def delete_zone(client, zone_id), do: Client.delete(client, "/zones/#{zone_id}.json")

  @doc """
  Clears the entire cache of a Pull Zone specified by the {zone_id} parameter.
  """
  def purge_zone_cache(client, zone_id), do: Client.get(client, "/zones/purge/#{zone_id}.json")

  @doc """
  Clears the cache for the defined URL(s) by the {zone_id} parameter.
  """
  def purge_zone_url(client, zone_id, urls) when is_list(urls) do
    Client.delete(client, "/zones/purgeurl/#{zone_id}.json", %{urls: urls})
  end

  @doc """
  Returns a list of all Zone Aliases on the specified account.
  """
  def list_zone_aliases(client), do: Client.get(client, "/zonealiases.json")

  @doc """
  Adds a Zone Aliases for a given Zone.
  """
  def add_zone_aliases(client, params), do: Client.post(client, "/zonealiases.json", params)

  @doc """
  Edit the given Zone Alias specified by the parameter {zonealias_id} with the speciefied request parameters.
  """
  def edit_zone_aliases(client, params), do: Client.put(client, "/zonealiases.json", params)

  @doc """
  Delete the given Zone Alias specified by the parameter {zonealias_id}.
  """
  def delete_zone_aliases(client, zonealias_id) do
    Client.delete(client, "zonealiases/#{zonealias_id}.json")
  end

  @doc """
  Returns a list of all Zone Referrers on the specified account.
  """
  def list_zone_referrers(client), do: Client.get(client, "/zonereferrers.json")

  @doc """
  Adds a Zone Referrers for a given Zone.
  """
  def add_zone_referrers(client, params), do: Client.post(client, "/zonereferrers.json", params)

  @doc """
  Edit the given Zone Referrer specified by the parameter {zonereferrer_id} with the speciefied request parameters.
  """
  def edit_zone_referrers(client, zonereferrer_id, params) do
    Client.put(client, "/zonereferrers/#{zonereferrer_id}.json", params)
  end

  @doc """
  Delete the given Zone Referrer specified by the parameter {zonereferrer_id}.
  """
  def delete_zone_referrers(client, zonereferrer_id) do
    Client.delete(client, "/zonereferrers/#{zonereferrer_id}.json")
  end

  @doc """
  Returns a list of traffic statistics for a given time range.
  """
  def traffic_statistics(client, query_params) do
    Client.get(client, "/reports/traffic.json", query_params)
  end

  @doc """
  Returns a list of storage statistics for a given time range.
  """
  def storage_statistics(client, query_params) do
    Client.get(client, "/reports/storage.json", query_params)
  end

  @doc """
  Returns a list of Image Processing statistics for a given time range.
  """
  def image_processing_statistics(client, query_params) do
    Client.get(client, "/reports/ip.json", query_params)
  end

  @doc """
  Returns a list of state statistics for a given time range.
  """
  def status_statistics(client, query_params) do
    Client.get(client, "/reports/statestats.json", query_params)
  end

  @doc """
  Returns a list of credit bookings for a given time range.
  """
  def credits_statistics(client, query_params) do
    Client.get(client, "/reports/credits.json", query_params)
  end

  @doc """
  Returns the credit balance.
  """
  def credit_balance(client), do: Client.get(client, "/reports/creditbalance.json")
end
