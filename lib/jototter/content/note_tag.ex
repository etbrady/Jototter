defmodule Jototter.Content.NoteTag do
  use Jototter.Web, :model
  alias Jototter.Content.{Note,Tag}

  schema "note_tags" do
    belongs_to :note, Note, foreign_key: :note_id
    belongs_to :tag, Tag, foreign_key: :tag_id

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
