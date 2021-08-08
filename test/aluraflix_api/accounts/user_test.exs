defmodule AluraflixApi.Accounts.UserTest do
  use AluraflixApi.DataCase

  describe "users" do
    alias AluraflixApi.Accounts.User

    @valid_attrs %{email: "email1@email.com", password: "password"}

    test "email attribute must be valid" do
      attrs = %{@valid_attrs | email: "wrongemail"}
      changeset = User.changeset(%User{}, attrs)
      assert %{email: ["has invalid format"]} = errors_on(changeset)
    end

    test "password attribute must have at least 6 chars" do
      attrs = %{@valid_attrs | password: "short"}
      changeset = User.changeset(%User{}, attrs)
      assert %{password: ["should be at least 6 character(s)"]} = errors_on(changeset)
    end
  end
end
