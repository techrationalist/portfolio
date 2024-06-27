defmodule PortfolioWeb.ProjectsController do
  use PortfolioWeb, :controller

  def projects(conn, _params) do
    render(conn, :projects)
  end
end
