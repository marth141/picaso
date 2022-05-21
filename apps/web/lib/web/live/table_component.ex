defmodule TableComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <table>
      <thead>
        <tr>
          <%= for header <- extract_headers(@list_of_maps) do %>
            <th><%= header %></th>
          <% end %>
        </tr>
      </thead>
      <tbody>
        <%= for map <- @list_of_maps do %>
          <tr>
            <%= for header <- extract_headers(@list_of_maps) do %>
              <td><%= map[header] %></td>
            <% end %>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end

  defp extract_headers(list_of_maps) do
    Enum.map(list_of_maps, fn map ->
      Map.keys(map)
    end)
    |> List.flatten()
    |> Enum.sort()
    |> Enum.dedup()
  end
end
