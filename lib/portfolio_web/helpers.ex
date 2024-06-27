defmodule PortfolioWeb.Helpers do
  @moduledoc """
  This module provides helper functions for the PortfolioWeb application.
  It includes utilities that can be used across different parts of the web interface.
  """
  use Phoenix.Component
  import Phoenix.HTML
  alias Phoenix.LiveView.JS

  @doc """
  Obfuscates an email address to protect it from spam bots.

  This function is used to display email addresses on web pages in a way that
  makes them harder for automated scrapers to detect, while still being
  readable by humans.

  ## How it works:
  1. Replaces "@" with " [at] " and "." with " [dot] ".
  2. Converts each character to its HTML entity code.
  3. Keeps spaces as they are for readability.

  ## Usage:
  This function is typically used in templates where you want to display an
  email address, for example:

      <%= obfuscate_email("contact@example.com") %>

  ## Parameters:
  - email: A string containing the email address to obfuscate.

  ## Returns:
  A Phoenix.HTML.Safe.t() that can be safely rendered in HTML.

  """
  def obfuscate_email(email) do
    email
    |> String.replace("@", " [at] ")
    |> String.replace(".", " [dot] ")
    |> String.graphemes()
    |> Enum.map_join("", fn
      " " -> " "
      char ->
        <<code::utf8>> = char
        "&##{code};"
    end)
    |> raw()
  end

  attr :user, :string, required: true
  attr :domain, :string, required: true

  def obfuscate_email_link(assigns) do
    ~H"""
    <span id="obfuscated-email" class="text-blue-600 hover:underline cursor-pointer"
    phx-click={JS.dispatch("custom:open-email", detail: %{user: @user, domain: @domain})}
    >
      <%= obfuscate_email("#{@user}@#{@domain}") %>
    </span>
    """
  end
end
