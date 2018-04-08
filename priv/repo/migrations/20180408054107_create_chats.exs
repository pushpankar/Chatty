defmodule Chatty.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :from, :string
      add :text, :string

      timestamps()
    end

  end
end
