defmodule Rinha.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rinha.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        apelido: "some apelido",
        nascimento: ~D[2023-08-24],
        nome: "some nome",
        stack: ["option1", "option2"]
      })
      |> Rinha.Accounts.create_user()

    user
  end
end
