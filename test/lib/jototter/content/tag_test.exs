defmodule Jototter.TagTest do
  use Jototter.ModelCase

  alias Jototter.Content.Tag

  @valid_attrs %{label: "some label"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Tag.changeset(%Tag{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Tag.changeset(%Tag{}, @invalid_attrs)
    refute changeset.valid?
  end
end
