defmodule Jototter.Tag do
  use Jototter.Web, :model

  schema "tags" do
    field :label, :string

    timestamps()

    belongs_to :user, Jototter.User
    many_to_many :notes, Jototter.Note, join_through: Jototter.NoteTag
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
