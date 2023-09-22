# JustStore

To start JustStore project:

  * Run `docker compose up` to setup PostgreSql and install dependencies
  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Run mutation `mockItemDetails` - Apesar de dar erro insere o detalhe dos itens no banco de dados
    
 ![image](https://i.imgur.com/gqwBPhW.png)
```
mutation {
  mockItemDetails{id}
}
```

## Mutations

  * Create cart
  ![image](https://i.imgur.com/qMKNpfS.png)
```
mutation {
  createCart{id}
}

```

  * View Cart
  ![image](https://i.imgur.com/L8BRcfM.png)
```
{
  cart(cartId: 1) {
    id
    items {
      quantity
      itemDetails {
      	name
        description
        price
      }
    }
    totalCartValue
    totalCartValueAVista
		insertedAt
    updatedAt
  }
}

```

  * Add item to cart
  ![image](https://i.imgur.com/a5DYM6H.png)
```
{
 mutation {
  addItemToCart(cartId: 1, itemDetailsId: 3, quantity: 15) {
    id
  }
}

```

  * Remove item from cart
  ![image](https://i.imgur.com/5YVEMmE.png)
```
mutation {
  removeItemFromCart(cartId: 1, itemDetailsId: 3, quantity: 10) {
    id
  }
}

```

## Tests
 ![image](https://i.imgur.com/D6H75fy.png)
  
