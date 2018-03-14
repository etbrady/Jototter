defmodule Jototter.Repo.Migrations.CreateNotesTags do
  use Ecto.Migration

  def change do
    create table(:notes_tags) do
      add :note_id, references(:notes)
      add :tag_id, references(:tags)

      timestamps()
    end
  end
end
