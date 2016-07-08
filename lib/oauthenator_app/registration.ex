defmodule OauthenatorApp.Registration do
  use OauthenatorApp
  import Plug.Conn

  require EEx
  EEx.function_from_file :defp, :render_new, "templates/registration/new.eex", [:title]

  def new(conn) do
    conn |> send_resp(200, render_new("Register"))
  end

end
