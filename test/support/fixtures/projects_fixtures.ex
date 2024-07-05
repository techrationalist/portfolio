defmodule Portfolio.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Portfolio.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        github_url: "some github_url",
        image_url: "some image_url",
        live_url: "some live_url",
        technologies: ["option1", "option2"],
        title: "some title"
      })
      |> Portfolio.Projects.create_project()

    project
  end
end
