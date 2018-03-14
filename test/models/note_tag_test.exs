defmodule Jototter.NoteTagTest do
  use Jototter.ModelCase

  alias Jototter.NoteTag

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = NoteTag.changeset(%NoteTag{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = NoteTag.changeset(%NoteTag{}, @invalid_attrs)
    refute changeset.valid?
  end
end
