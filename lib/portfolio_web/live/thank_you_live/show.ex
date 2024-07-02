defmodule PortfolioWeb.ThankYouLive do
  use PortfolioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :start_countdown, 0)
    end

    {:ok, assign(socket, countdown: 6, progress: 0, redirect_cancelled: false)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :show, _params) do
    socket
    |> assign(:page_title, "Thank You")
  end

  @impl true
  def handle_info(:start_countdown, socket) do
    :timer.send_interval(1000, self(), :tick)
    {:noreply, update_countdown(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, update_countdown(socket)}
  end

  defp update_countdown(%{assigns: %{countdown: 1, redirect_cancelled: false}} = socket) do
    push_navigate(socket, to: "/")
  end

  defp update_countdown(%{assigns: %{redirect_cancelled: false}} = socket) do
    socket
    |> update(:countdown, &(&1 - 1))
    |> update(:progress, &(&1 + 20))
  end

  defp update_countdown(socket), do: socket

  @impl true
  def handle_event("stay", _, socket) do
    {:noreply, assign(socket, redirect_cancelled: true)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="fixed inset-0 flex items-center justify-center bg-base-300 bg-opacity-50 z-50 animate-fade-in">
      <div class="bg-base-100 p-6 rounded-lg shadow-lg max-w-sm w-full mx-4 animate-slide-up">
        <div class="text-center">
          <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-success text-success-content mb-4 animate-success-icon">
            <i class="fas fa-check text-2xl"></i>
          </div>
          <h2 class="text-2xl font-semibold mb-2">Thank You!</h2>
          <p class="text-base-content/70 mb-4">
            Your message has been sent successfully. I'll get back to you soon.
          </p>
        </div>
        <div class="flex justify-between items-center mt-6">
          <.link navigate="/" class="btn btn-primary btn-sm">
            Back to Home
          </.link>
          <button phx-click="stay" class="btn btn-ghost btn-sm">
            Stay on this page
          </button>
        </div>
        <%= if not @redirect_cancelled do %>
          <div class="mt-4 text-center text-sm text-base-content/50">
            Redirecting in <%= @countdown %> seconds
          </div>
          <div class="mt-2 w-full bg-base-200 rounded-full h-1.5">
            <div
              class="bg-primary h-1.5 rounded-full transition-all duration-1000 ease-linear"
              style={"width: #{@progress}%"}
            >
            </div>
          </div>
        <% else %>
          <div class="mt-4 text-center text-sm text-success">
            Redirect cancelled
          </div>
          <div class="mt-2 w-full bg-success h-1.5 rounded-full"></div>
        <% end %>
      </div>
    </div>
    """
  end
end
