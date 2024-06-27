defmodule PortfolioWeb.Plugs.PageTitle do
  @moduledoc """
  A plug for setting the page title in the connection assigns.

  This plug allows setting a page title either from the request params or using a default value.
  """

  import Plug.Conn

  @doc """
  Initializes the plug with a default page title.

  ## Parameters
    - default: The default page title to use when not provided in params.

  ## Returns
    The default value unchanged.
  """
  def init(default), do: default

  @doc """
  Sets the page title in the connection assigns.

  ## Parameters
    - conn: The connection struct.
    - _default: The default page title (unused in this clause).

  ## Returns
    The updated connection with the :page_title assign set from params.
  """
  def call(%Plug.Conn{params: %{"page_title" => page_title}} = conn, _default)  do
    assign(conn, :page_title, page_title)
  end

  def call(conn, default), do: assign(conn, :page_title, default)

end
