defmodule Jototter.NoteTest do
  use Jototter.ModelCase

  alias Jototter.Content.Note

  @valid_attrs %{text: "some text"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Note.changeset(%Note{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Note.changeset(%Note{}, @invalid_attrs)
    refute changeset.valid?
  end
end
