defmodule PhoenixCommerce.Repo.Migrations.CreateLineItem do
  use Ecto.Migration

  def change do
    create table(:line_items) do
      add :quantity, :integer
      add :product_id, references(:products, on_delete: :nothing)

      timestamps
    end
    create index(:line_items, [:product_id])

  end
end
