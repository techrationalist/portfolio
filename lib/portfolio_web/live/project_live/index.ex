defmodule PortfolioWeb.ProjectLive.Index do
  use PortfolioWeb, :live_view

  alias Portfolio.Projects
  alias Portfolio.Projects.Project

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(Portfolio.PubSub, "projects")
    end
    {:ok, stream(socket, :projects, Projects.list_projects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Project")
    |> assign(:project, Projects.get_project!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Project")
    |> assign(:project, %Project{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Projects")
    |> assign(:project, nil)
  end

  @impl true
  def handle_info({:project_created, project}, socket) do
    {:noreply, stream_insert(socket, :projects, project)}
  end

  @impl true
  def handle_info({:project_updated, project}, socket) do
    {:noreply, stream_insert(socket, :projects, project)}
  end

  @impl true
  def handle_info({:project_deleted, _project}, socket) do
    # TODO: I was trying to use stream_delete but it was not working.
    # {:noreply, stream_delete(socket, :projects, project)}
    # So I am just refreshing the page to get the latest data.
    # Please let me know if there is a better way to do this.
    {:noreply, push_navigate(socket, to: ~p"/projects")}
  end

end
