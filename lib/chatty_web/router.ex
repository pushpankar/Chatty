defmodule ChattyWeb.Router do
  use ChattyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChattyWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/xyz", WelcomeController, :index
    get "/xyz/:message", WelcomeController, :show
    resources "/user", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChattyWeb do
  #   pipe_through :api
  # end
  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Chatty.Accounts.get_user!(user_id))
    end
  end
end
