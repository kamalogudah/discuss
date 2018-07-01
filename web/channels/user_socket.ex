defmodule Discuss.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "comments:*", Discuss.CommentsChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket
  # transport :longpoll, Phoenix.Transports.LongPoll

  def connect(%{"token" => token}, socket) do
    IO.puts token
    {:ok, socket}
  end

  def id(_socket), do: nil
end
