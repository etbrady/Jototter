defmodule Jototter.NoteTag do
  use Jototter.Web, :model

  schema "note_tags" do
    belongs_to :note, Jototter.Note, foreign_key: :note_id
    belongs_to :tag, Jototter.Tag, foreign_key: :tag_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
