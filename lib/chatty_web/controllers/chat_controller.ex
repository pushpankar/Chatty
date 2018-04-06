defmodule ChattyWeb.ChatController do
  use ChattyWeb, :controller

  def index(conn, _params) do
    render conn, "lobby.html"
  end
end
