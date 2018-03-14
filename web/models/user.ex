defmodule Jototter.User do
  use Jototter.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string

    has_many :notes, Jototter.Note
    has_many :tags, Jototter.Tag

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :email])
    |> validate_required([:first_name, :last_name, :email])
  end
end
