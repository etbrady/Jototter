defmodule Jototter.Tag do
  use Jototter.Web, :model

  schema "tags" do
    field :label, :string

    timestamps()

    many_to_many :notes, Jototter.Note, join_through: "notes_tags"
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
