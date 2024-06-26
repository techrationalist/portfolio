defmodule PortfolioWeb.MessageController do
  use PortfolioWeb, :controller

  alias Portfolio.Contact
  alias Portfolio.Contact.Message

  def new(conn, _params) do
    changeset = Contact.change_message(%Message{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"message" => message_params}) do
    case Contact.create_message(message_params) do
      {:ok, message} ->
        conn
        |> put_flash(:info, "Message sent successfully.")
        |> redirect(to: ~p"/contact/thank-you") # Redirect to the home page

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def thank_you(conn, _params) do
    render(conn, :thank_you)
  end
end
