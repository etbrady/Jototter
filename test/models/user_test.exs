defmodule Jototter.UserTest do
  use Jototter.ModelCase

  alias Jototter.User

  @invalid_attrs %{}

  test "changeset with invalid attributes" do
    changeset = User.update_changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
