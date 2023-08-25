defmodule RinhaWeb.UserJSON do
  alias Rinha.Accounts.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      nome: user.nome,
      apelido: user.apelido,
      nascimento: user.nascimento,
      stack: user.stack
    }
  end
end