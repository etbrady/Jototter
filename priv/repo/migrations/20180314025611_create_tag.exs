defmodule Jototter.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :label, :string

      timestamps()
    end
  end
end
