defmodule Portfolio.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias Portfolio.Repo

  alias Portfolio.Projects.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  @doc """
  Seeds the database with sample projects.

  This function creates and inserts three sample projects into the database:
  1. Personal Blog
  2. Task Manager API
  3. Weather Dashboard

  Each project includes:
  - A title
  - A detailed description in Markdown format
  - A list of technologies used
  - An image URL
  - A GitHub URL
  - A live URL (if applicable)

  This function is useful for populating the database with initial data for
  development or testing purposes.

  ## Usage

      iex> Portfolio.Projects.Project.seed_sample_projects()

  Note: This function should typically be used in development or testing
  environments, not in production.
  """
  def seed_sample_projects do
    projects = [
      %{
        title: "Personal Blog",
        description: """
        # Personal Blog

        A responsive blog built with Phoenix and Tailwind CSS, featuring:

        - **Responsive design** for optimal viewing on all devices
        - **Markdown support** for easy content creation
        - **Tag system** for organizing posts
        - **Comment section** with moderation capabilities
        - **RSS feed** for subscribers

        This project showcases my skills in full-stack web development and UI/UX design.
        """,
        technologies: ["Elixir", "Phoenix", "Tailwind CSS", "PostgreSQL"],
        image_url: "https://example.com/personal-blog.jpg",
        github_url: "https://github.com/username/personal-blog",
        live_url: "https://my-personal-blog.com"
      },
      %{
        title: "Task Manager API",
        description: """
        # Task Manager API

        A RESTful API for a task management application, built with:

        - **Phoenix Framework** for robust backend development
        - **PostgreSQL** for reliable data storage
        - **JWT authentication** for secure user access
        - **Swagger documentation** for easy API exploration

        ## Key Features:
        1. Create, read, update, and delete tasks
        2. Assign tasks to users
        3. Set due dates and priorities
        4. Filter and sort tasks
        5. User management and authentication

        This project demonstrates my expertise in backend development and API design.
        """,
        technologies: ["Elixir", "Phoenix", "PostgreSQL", "Swagger"],
        github_url: "https://github.com/username/task-manager-api",
        live_url: "https://api.task-manager.com"
      },
      %{
        title: "Weather Dashboard",
        description: """
        # Real-time Weather Dashboard

        An interactive weather dashboard using Phoenix LiveView, featuring:

        - **Real-time updates** without page reloads
        - **OpenWeatherMap API integration** for accurate weather data
        - **Geolocation support** for automatic location detection
        - **5-day forecast** with detailed hourly predictions
        - **Interactive maps** showing weather patterns

        ## Key Components:
        - Temperature and humidity displays
        - Wind speed and direction indicators
        - Precipitation probability charts
        - UV index warnings
        - Air quality information

        This project showcases my ability to create dynamic, real-time web applications with Elixir and Phoenix LiveView.
        """,
        technologies: ["Elixir", "Phoenix LiveView", "OpenWeatherMap API"],
        github_url: "https://github.com/username/weather-dashboard",
        live_url: "https://weather.example.com"
      }
    ]

    Enum.each(projects, fn project ->
      Portfolio.Projects.create_project(project)
    end)
  end
end
