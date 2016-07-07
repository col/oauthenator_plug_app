defmodule OauthenatorApp.RouterTest do
  use ExUnit.Case
  use Plug.Test
  alias OauthenatorApp.Router

  @router_opts Router.init([])

  test "get /" do
    conn = conn(:get, "/") |> Router.call(@router_opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert String.match?(conn.resp_body, ~r/ok/)
  end

  test "get /hello" do
    conn = conn(:get, "/hello") |> Router.call(@router_opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert String.match?(conn.resp_body, ~r/Hello World!/)
  end

  test "get unknown path returns 404" do
    conn = conn(:get, "/adflkasdfj") |> Router.call(@router_opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert String.match?(conn.resp_body, ~r/Not Found/)
  end

end
