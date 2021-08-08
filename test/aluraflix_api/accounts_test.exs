defmodule AluraflixApi.AccountsTest do
  use AluraflixApi.DataCase

  alias AluraflixApi.Accounts

  describe "users" do
    alias AluraflixApi.Accounts.User

    @valid_attrs %{email: "email1@email.com", password: "password"}
    @invalid_attrs %{email: nil, encrypted_password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id).id == user.id
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "email1@email.com"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "get_by_email/1 with valid email" do
      user_fixture()
      email = @valid_attrs.email
      assert {:ok, %User{} = user} = Accounts.get_by_email(email)
      assert user.email == email
    end

    test "get_by_email/1 with invalid email" do
      email = "wrong"
      assert {:error, :not_found} = Accounts.get_by_email(email)
    end
  end
end
