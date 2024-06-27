defmodule PortfolioWeb.ProjectsHTML do
  use PortfolioWeb, :html
  import Phoenix.HTML, only: [raw: 1]


  embed_templates "projects_html/*"

  slot :inner_block, required: true

  attr :entries, :list, default: []

  def project_list(assigns) do
    ~H"""
    <ul>
      <%= for entry <- @entries do %>
        <li>
          <%= render_slot(@inner_block, raw(Earmark.as_html!(entry))) %>
        </li>
        <br/>
        <br/>
      <% end %>
    </ul>
    """
  end

  @doc """
  Reads and returns the content of all Markdown project files.

  This function performs the following steps:
  1. Finds all Markdown files in the "priv/static/projects/" directory.
  2. Sorts the files numerically based on their prefix (e.g., "01_", "02_").
  3. Reads the content of each file.

  File naming convention:
  The project files should be named in the format "nn_xxx.md", where:
  - "nn" is a two-digit number starting from 01
  - "xxx" is the rest of the file name

  Returns:
  A list of strings, where each string is the content of a project file.

  Example:
      iex> read_project_files()
      ["# Project 1\n\nContent...", "# Project 2\n\nContent...", ...]
  """
  def read_project_files() do
    Path.wildcard("priv/static/projects/*.md")
    |> Enum.sort_by(&(Path.basename(&1, ".md")))
    |> Enum.map(&File.read!/1)
  end
end
