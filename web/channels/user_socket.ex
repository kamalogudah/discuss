defmodule Discuss.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "comments:*", Discuss.CommentsChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket
  # transport :longpoll, Phoenix.Transports.LongPoll

  def connect(%{"token" => token}, socket) do
    case Phoenix.Token.verify(socket, "key", token) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}

      {:error, _error} ->
        :error
    end
  end

  def id(_socket), do: nil
end
