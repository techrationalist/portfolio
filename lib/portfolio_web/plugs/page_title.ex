defmodule PortfolioWeb.Plugs.PageTitle do
  import Plug.Conn

  def init(default), do: default


  def call(%Plug.Conn{params: %{"page_title" => page_title}} = conn, _default)  do
    assign(conn, :page_title, page_title)
  end

  def call(conn, default), do: assign(conn, :page_title, default)

end
