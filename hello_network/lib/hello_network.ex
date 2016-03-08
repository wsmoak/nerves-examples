defmodule HelloNetwork do

  require Logger
  alias Nerves.Networking

  def start(_type, _args) do
    unless :os.type == {:unix, :darwin} do     # don't start networking unless we're on nerves
      {:ok, _} = Networking.setup :eth0
    end
    {:ok, _} = publish
    {:ok, self}
  end

  defp publish(args \\ []) do
    alias Nerves.Lib.UUID
    usn = "uuid:" <> UUID.generate
    case Nerves.SSDPServer.publish(usn, args) do
      {:ok, _} -> {:ok, usn}
      {:error, reason} -> {:error, reason}
    end
  end
  
end