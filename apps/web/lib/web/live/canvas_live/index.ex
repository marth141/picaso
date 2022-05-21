defmodule Web.CanvasLive.Index do
  use Web, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:hello, "hello")
     |> assign(:list_of_maps, [
       %{"a" => "hello", "b" => "world"},
       %{"a" => "bob", "b" => "marley"},
       %{"a" => "lotsa", "b" => "data"},
       %{"b" => "lessa", "c" => "data"}
     ])}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Canvas Live")
  end
end
