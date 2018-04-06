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
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChattyWeb do
  #   pipe_through :api
  # end
end
