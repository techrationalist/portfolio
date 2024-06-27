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
    |> String.graphemes()  # Use String.graphemes() for proper Unicode handling
    |> Enum.map(fn char ->
      case char do
        " " -> " "  # Keep spaces as they are for readability
        _ ->
          # For any character that is not a space:

          # Convert the character to its Unicode code point
          <<code::utf8>> = char

          # Create an HTML entity using the Unicode code point
          # This format (&#xxxx;) is called a numeric character reference
          # It's a way to represent characters in HTML using their Unicode values
          "&##{code};"  # e.g., 'A' becomes '&#65;'

          # Using HTML entities makes it harder for bots to recognize the email
          # while still allowing browsers to correctly display the character
      end
    end)
    |> Enum.join("")
    |> raw()  # Mark the result as safe HTML to prevent double-escaping
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
