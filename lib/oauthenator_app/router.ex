defmodule OauthenatorApp.Router do
  use OauthenatorApp
  use Plug.Router
  require Logger
  import Plug.Conn

  plug Plug.Logger
  plug :use_html
  plug :match
  plug :dispatch

  def use_html(conn, _) do
    put_resp_content_type(conn, "text/html")
  end

  def init(options) do
    options
  end

  require EEx
  EEx.function_from_file :defp, :index_template, "templates/index.eex", [:title]

  get "/" do
    conn |> send_resp(200, index_template("ok"))
  end

  get "/hello" do
    conn |> send_resp(200, index_template("Hello World!"))
  end

  get "/register" do
    Registration.new(conn)
  end

  get _ do
    conn |> send_resp(404, index_template("Not Found"))
  end
end
