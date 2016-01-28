defmodule PhoenixCommerce.LineItem do
  use PhoenixCommerce.Web, :model

  schema "line_items" do
    field :quantity, :integer
    belongs_to :product, PhoenixCommerce.Product
    belongs_to :cart, PhoenixCommerce.Cart
    timestamps
  end

  @required_fields ~w(product_id quantity cart_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
