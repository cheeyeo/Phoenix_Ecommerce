defmodule PhoenixCommerce.CartController do
  use PhoenixCommerce.Web, :controller

  alias PhoenixCommerce.{LineItem, Cart}

  plug :add_cart

  def add_cart(conn, _opts) do
    # We look in the session to see if there's a cart uuid
    cart = case get_session(conn, :cart_uuid) do
      # If there's not one, we insert a new cart
      nil ->
        Repo.insert!(%Cart{})
      # Otherwise, we fetch the cart with that uuid from the repo
      cart_uuid ->
        query =
          from c in Cart,
          where: c.uuid == ^cart_uuid
        Repo.one(query)
    end

    # Then we'll assign the cart to the assigns map, and we'll set the uuid in
    # the session.
    conn
    |> assign(:cart, cart)
    |> put_session(:cart_uuid, cart.uuid)
  end

  def show(conn, _params) do
    query =
      from li in LineItem,
      where: li.cart_id == ^conn.assigns[:cart].id,
      preload: [:product]

    line_items = Repo.all(query)

    render conn, "show.html", %{line_items: line_items}
  end

  def add(conn, %{"product" => %{"id" => product_id}}) do
    LineItem.changeset(%LineItem{}, %{
      product_id: product_id,
      quantity: 1,
      cart_id: conn.assigns[:cart].id
    }) |> Repo.insert!

    redirect conn, to: cart_path(conn, :show)
  end
end
