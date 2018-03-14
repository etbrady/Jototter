defmodule Jototter.Repo.Migrations.CreateNote do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :text, :text

      timestamps()
    end
  end
end
