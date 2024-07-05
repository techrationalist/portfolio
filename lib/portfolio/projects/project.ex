defmodule Portfolio.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :title, :string
    field :technologies, {:array, :string}
    field :image_url, :string
    field :github_url, :string
    field :live_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :description, :technologies, :image_url, :github_url, :live_url])
    |> validate_required([:title, :description])
  end
end
