defmodule Portfolio.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :description, :text
      add :technologies, {:array, :string}
      add :image_url, :string
      add :github_url, :string
      add :live_url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
