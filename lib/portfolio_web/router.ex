defmodule PortfolioWeb.Router do
  use PortfolioWeb, :router

  import PortfolioWeb.AdminAuth
  import LiveAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PortfolioWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_admin
    plug PortfolioWeb.Plugs.PageTitle, "Tech Rationalist"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug :require_authenticated_admin
  end

  scope "/", PortfolioWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/about-me", AboutMeController, :about_me

    get "/contact", MessageController, :new
    post "/contact", MessageController, :create
    live "/contact/thank-you", ThankYouLive, :show

    live "/projects", ProjectLive.Index, :index
    live "/projects/:id", ProjectLive.Show, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", PortfolioWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:portfolio, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PortfolioWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", PortfolioWeb do
    pipe_through [:browser, :redirect_if_admin_is_authenticated]

    live_session :redirect_if_admin_is_authenticated,
      on_mount: [{PortfolioWeb.AdminAuth, :redirect_if_admin_is_authenticated}] do
      live "/admins/log_in", AdminLoginLive, :new
    end

    post "/admins/log_in", AdminSessionController, :create
  end

  scope "/", PortfolioWeb do
    pipe_through [:browser, :require_authenticated_admin]

    live_session :require_authenticated_admin,
      on_mount: [{PortfolioWeb.AdminAuth, :ensure_authenticated}] do
    end
  end

  scope "/", PortfolioWeb do
    pipe_through [:browser]

    delete "/admins/log_out", AdminSessionController, :delete
  end

  scope "/", PortfolioWeb do
    pipe_through [:browser, :admin]

    live_admin "/admin" do
      admin_resource("/backoffice/admin", Portfolio.LiveAdmin.Backoffice.Admin)
      admin_resource("/backoffice/admin-token", Portfolio.LiveAdmin.Backoffice.AdminToken)
      admin_resource("/projects/project", Portfolio.LiveAdmin.Projects.Project)
      admin_resource("/contact/message", Portfolio.LiveAdmin.Contact.Message)
    end
  end
end
