defmodule Portfolio.ContactFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Portfolio.Contact` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        body: "some body",
        email: "some email",
        name: "some name",
        subject: "some subject"
      })
      |> Portfolio.Contact.create_message()

    message
  end
end
