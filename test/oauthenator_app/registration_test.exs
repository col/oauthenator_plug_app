defmodule OauthenatorApp.RegistrationTest do
  use ExUnit.Case
  use Plug.Test
  use OauthenatorApp

  @router_opts Router.init([])

  test "get /register" do
    conn = conn(:get, "/register") |> Router.call(@router_opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert String.match?(conn.resp_body, ~r/Register/)
  end

end
