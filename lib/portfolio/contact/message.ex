defmodule Portfolio.Contact.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :name, :string
    field :body, :string
    field :email, :string
    field :subject, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :email, :subject, :body])
    |> validate_required([:name, :email, :subject, :body])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must be a valid email address")
    |> validate_length(:email, max: 160, message: "should be at most 160 characters")
    |> validate_length(:name, min: 2, max: 100, message: "should be between 2 and 100 characters")
    |> validate_length(:subject, min: 5, max: 200, message: "should be between 5 and 200 characters")
    |> validate_length(:body, min: 10, max: 5000, message: "should be between 10 and 5000 characters")
    |> validate_format(:name, ~r/^[a-zA-Z\s'-]+$/, message: "should only contain letters, spaces, hyphens, and apostrophes")
  end

end
