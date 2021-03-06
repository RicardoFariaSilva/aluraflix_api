defmodule AluraflixApiWeb.Router do
  use AluraflixApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug AluraflixApiWeb.Auth.Pipeline
  end

  scope "/api", AluraflixApiWeb, as: :api do
    pipe_through :api

    scope "/v1", Api.V1, as: :v1 do
      get "/videos/free", VideoController, :free, as: :free_videos
      post "/users/signup", UserController, :create
      post "/users/signin", UserController, :signin
    end
  end

  scope "/api", AluraflixApiWeb, as: :api do
    pipe_through [:api, :auth]

    scope "/v1", Api.V1, as: :v1 do
      resources "/videos", VideoController, except: [:new, :edit]
      resources "/categories", CategoryController, except: [:new, :edit] do
        resources "/videos", Categories.VideoController, only: [:index]
      end
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: AluraflixApiWeb.Telemetry
    end
  end
end
