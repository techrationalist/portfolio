defmodule PortfolioWeb.ProjectLive.Show do
  use PortfolioWeb, :live_view

  alias Portfolio.Projects

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    project = Projects.get_project!(id)

    {:ok, html_description, _} =
      Earmark.as_html(project.description,
        gfm: true,
        breaks: true,
        smartypants: true,
        code_class_prefix: "language-"
      )


    {:noreply,
     socket
     |> assign(:project, project)
     |> assign(:html_description, html_description)}
  end
end
