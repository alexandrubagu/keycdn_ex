# KeyCDN

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `keycdn` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:keycdn, "~> 0.1.0"}
  ]
end
```

Usage:

### Returns all zones

```elixir
  iex> client = KeyCDN.Client.new(<API_KEY>)
  iex> KeyCDN.list_zones(client)
```

### Returns a specific zone

```elixir
  iex> client = KeyCDN.Client.new(<API_KEY>)
  iex> KeyCDN.list_zones(client, <zone_id>)
```

### Creates a zone

```elixir
  iex> client = KeyCDN.Client.new(<API_KEY>)
  iex> KeyCDN.add_zone(client, %{name: "x", type: "push", ...})
```

### Updates a specific zone

```elixir
  iex> client = KeyCDN.Client.new(<API_KEY>)
  iex> KeyCDN.list_zones(client, <zone_id>, %{name: "x", type: "push", ...})
```

### Deletes a specific zone

```elixir
  iex> client = KeyCDN.Client.new(<API_KEY>)
  iex> KeyCDN.delete_zone(client, <zone_id>)
```

### Purge zone cache

```elixir
  iex> client = KeyCDN.Client.new(<API_KEY>)
  iex> KeyCDN.purge_zone_cache(client, <zone_id>)
```

### Purge zone urls

```elixir
  iex> client = KeyCDN.Client.new(<API_KEY>)
  iex> KeyCDN.purge_zone_cache(client, <zone_id>, [
    "example.com/style.css",
    "example.com/image.png"
  ])
```
