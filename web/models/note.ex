defmodule Jototter.Note do
  use Jototter.Web, :model

  schema "notes" do
    field :text, :string

    timestamps()

    many_to_many :tags, Jototter.Tag, join_through: "notes_tags"
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
