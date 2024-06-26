defmodule Portfolio.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :email, :string
      add :subject, :string
      add :body, :text

      timestamps(type: :utc_datetime)
    end
  end
end
