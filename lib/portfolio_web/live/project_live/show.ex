defmodule PortfolioWeb.ProjectLive.Show do
  use PortfolioWeb, :live_view

  alias Portfolio.Projects

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(Portfolio.PubSub, "projects")
    end

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

  @impl true
  def handle_info({:project_updated, project}, socket) do
    if project.id == socket.assigns.project.id do
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
    else
      {:noreply, socket}
    end
  end

  @impl true
  def handle_info({:project_deleted, project}, socket) do
    if project.id == socket.assigns.project.id do
      {:noreply, push_navigate(socket, to: ~p"/projects")}
    else
      {:noreply, socket}
    end
  end
end
