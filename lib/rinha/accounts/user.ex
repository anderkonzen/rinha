defmodule Rinha.Accounts.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :apelido, :string
    field :nascimento, :date
    field :nome, :string
    field :stack, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nome, :apelido, :nascimento, :stack])
    |> validate_required([:nome, :apelido, :nascimento, :stack])
  end
end
