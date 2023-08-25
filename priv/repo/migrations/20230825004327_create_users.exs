defmodule Rinha.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nome, :string
      add :apelido, :string
      add :nascimento, :date
      add :stack, {:array, :string}

      timestamps()
    end
  end
end
