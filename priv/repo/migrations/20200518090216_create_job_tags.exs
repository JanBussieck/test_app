defmodule Testapp.Repo.Migrations.CreateJobTags do
  use Ecto.Migration

  def change do
    create table(:job_tags) do
      add :job_id, references(:jobs, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps()
    end

    create index(:job_tags, [:job_id])
    create index(:job_tags, [:tag_id])
    create unique_index(:job_tags, [:job_id, :tag_id])
  end
end
