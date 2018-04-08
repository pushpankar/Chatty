defmodule Chatty.Chat do
  use Ecto.Schema
  import Ecto.Changeset


  schema "chats" do
    field :from, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:from, :text])
    |> validate_required([:from, :text])
  end
end
