defmodule Testapp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :occupation, :string
      add :accepts_terms, :boolean, default: false, null: false

      timestamps()
    end

  end
end
