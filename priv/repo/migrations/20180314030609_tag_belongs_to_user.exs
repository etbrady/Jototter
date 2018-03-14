defmodule Jototter.Repo.Migrations.TagBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      add :user_id, references(:users)
    end
  end
end
