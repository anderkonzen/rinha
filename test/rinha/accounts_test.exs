defmodule Rinha.AccountsTest do
  use Rinha.DataCase

  alias Rinha.Accounts

  describe "users" do
    alias Rinha.Accounts.User

    import Rinha.AccountsFixtures

    @invalid_attrs %{apelido: nil, nascimento: nil, nome: nil, stack: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{apelido: "some apelido", nascimento: ~D[2023-08-24], nome: "some nome", stack: ["option1", "option2"]}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.apelido == "some apelido"
      assert user.nascimento == ~D[2023-08-24]
      assert user.nome == "some nome"
      assert user.stack == ["option1", "option2"]
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{apelido: "some updated apelido", nascimento: ~D[2023-08-25], nome: "some updated nome", stack: ["option1"]}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.apelido == "some updated apelido"
      assert user.nascimento == ~D[2023-08-25]
      assert user.nome == "some updated nome"
      assert user.stack == ["option1"]
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
