defmodule Portfolio.ProjectsTest do
  use Portfolio.DataCase

  alias Portfolio.Projects

  describe "projects" do
    alias Portfolio.Projects.Project

    import Portfolio.ProjectsFixtures

    @invalid_attrs %{description: nil, title: nil, technologies: nil, image_url: nil, github_url: nil, live_url: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", title: "some title", technologies: ["option1", "option2"], image_url: "some image_url", github_url: "some github_url", live_url: "some live_url"}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.title == "some title"
      assert project.technologies == ["option1", "option2"]
      assert project.image_url == "some image_url"
      assert project.github_url == "some github_url"
      assert project.live_url == "some live_url"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", technologies: ["option1"], image_url: "some updated image_url", github_url: "some updated github_url", live_url: "some updated live_url"}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.title == "some updated title"
      assert project.technologies == ["option1"]
      assert project.image_url == "some updated image_url"
      assert project.github_url == "some updated github_url"
      assert project.live_url == "some updated live_url"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end
end
