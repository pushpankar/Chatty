defmodule ChattyWeb.WelcomeController do
  use ChattyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def show(conn, %{"message" => message}) do
    render conn, "show.html", msg: message
  end
end
