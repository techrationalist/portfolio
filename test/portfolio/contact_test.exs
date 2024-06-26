defmodule Portfolio.ContactTest do
  use Portfolio.DataCase

  alias Portfolio.Contact

  describe "messages" do
    alias Portfolio.Contact.Message

    import Portfolio.ContactFixtures

    @invalid_attrs %{name: nil, body: nil, email: nil, subject: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Contact.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Contact.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{name: "some name", body: "some body", email: "some email", subject: "some subject"}

      assert {:ok, %Message{} = message} = Contact.create_message(valid_attrs)
      assert message.name == "some name"
      assert message.body == "some body"
      assert message.email == "some email"
      assert message.subject == "some subject"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contact.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{name: "some updated name", body: "some updated body", email: "some updated email", subject: "some updated subject"}

      assert {:ok, %Message{} = message} = Contact.update_message(message, update_attrs)
      assert message.name == "some updated name"
      assert message.body == "some updated body"
      assert message.email == "some updated email"
      assert message.subject == "some updated subject"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Contact.update_message(message, @invalid_attrs)
      assert message == Contact.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Contact.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Contact.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Contact.change_message(message)
    end
  end
end
