defmodule Jototter.NoteTagTest do
  use Jototter.ModelCase

  alias Jototter.NoteTag

  @valid_attrs %{}

  test "changeset with valid attributes" do
    changeset = NoteTag.changeset(%NoteTag{}, @valid_attrs)
    assert changeset.valid?
  end

end
