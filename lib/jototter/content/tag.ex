defmodule Jototter.Content.Tag do
  use Jototter.Web, :model
  alias Jototter.Content.{Note,NoteTag}

  schema "tags" do
    field :label, :string

    timestamps()

    belongs_to :user, Jototter.User
    many_to_many :notes, Note, join_through: NoteTag
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:label])
    |> validate_required([:label])
  end
end
