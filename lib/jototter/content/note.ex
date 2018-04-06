defmodule Jototter.Content.Note do
  use Jototter.Web, :model
  alias Jototter.Content.{NoteTag,Tag}

  schema "notes" do
    field :text, :string

    timestamps()

    belongs_to :user, Jototter.User
    many_to_many :tags, Tag, join_through: NoteTag
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text])
    |> validate_required([:text])
  end
end
