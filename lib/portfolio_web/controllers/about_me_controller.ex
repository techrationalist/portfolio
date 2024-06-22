defmodule PortfolioWeb.AboutMeController do
  use PortfolioWeb, :controller

  def about_me(conn, _params) do
    render(conn, :about_me)
  end
end
