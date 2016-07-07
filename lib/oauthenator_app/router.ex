defmodule OauthenatorApp.Router do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  require EEx
  EEx.function_from_file :defp, :index_template, "templates/index.eex", [:title]

  get "/" do
    conn
      |> Plug.Conn.put_resp_content_type("text/html")
      |> Plug.Conn.send_resp(200, index_template("ok"))
      |> halt
  end

  get "/hello" do
    conn
      |> Plug.Conn.put_resp_content_type("text/html")
      |> Plug.Conn.send_resp(200, index_template("Hello World!"))
      |> halt
  end

  get _ do
    conn
      |> Plug.Conn.put_resp_content_type("text/html")
      |> Plug.Conn.send_resp(404, index_template("Not Found"))
      |> halt
  end
end
