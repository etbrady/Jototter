defmodule Jototter.Repo.Migrations.CreateNoteTag do
  use Ecto.Migration

  def change do
    create table(:note_tags) do
      add :note_id, references(:notes, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:note_tags, [:note_id, :tag_id])
  end
end
