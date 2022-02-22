
# WareHouse

Este projéto está responsavel pela entrada de lotes de produtos em um estoque.

#### Configuração inicial

Foi utilizada a `rails gem 'simple_token_authentication'` que em conjunto com a `gem 'devise'` espera um User.

Sendo assim, deve-se entrar em `rails c` e criar um novo usuario como:

`User.create(email: 'teste@teste.com.br', password: '123456')`

Retorno:

`Apenas exemplo: authentication_token: "newu2sj-fL8z7jyJ-twh"`

Deve-se guardar o `authentication_token` para conseguir usar os end-points.
## Documentação da API

Adicionar estes headers para todas as requisições.

`X-User-Email: teste@teste.com.br`

`X-User-Token: newu2sj-fL8z7jyJ-twh`

#### Retorna todas as entradas

```http
  GET /api/v1/product_entry
```

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
|  |  | **Obrigatório**. Nenhum |

#### Retorna uma entrada

```http
  GET /api/v1/product_entry/${id}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Obrigatório**. O ID do item que você quer |

#### Cria entrada de lotes nos estoques

```http
  POST /api/v1/product_entry
```

Espera um JSOM no Body da request neste formado:

```json
  {
    "product_entry": {
        "weight":"15",
        "meditate_unit":"toneladas",
        "prodentry_with_batch_stocks_attributes": {
            "stocks_attributes": [
                {
                    "name":"Armazem Bezerra",
                    "batches_attributes": [{
                        "name":"Soja",
                        "weight":"15",
                        "meditate_unit":"kilogramas"
                    }]
                }
            ]
        }
    }
}
```

Ou com muitos Stocks e muitos Lotes:

```json
  {
    "product_entry": {
        "weight":"15",
        "meditate_unit":"toneladas",
        "prodentry_with_batch_stocks_attributes": {
            "stocks_attributes": [
                {
                    "name":"Armazem Bezerra",
                    "batches_attributes": [{
                        "name":"Soja",
                        "weight":"15",
                        "meditate_unit":"kilogramas"
                    }]
                },
                {
                    "name":"Armazem Maria da Graca",
                    "batches_attributes": [{
                          "name":"Cafe",
                          "weight":"15",
                          "meditate_unit":"kilogramas"
                      },
                      {
                          "name":"Arroz",
                          "weight":"15",
                          "meditate_unit":"toneladas"
                      }
                    ]
                }
            ]
        }
    }
}
```

#### Atualiza uma entrada já cadastrada

```http
  PATCH ou PUT /api/v1/product_entry/:id
```

Use o mesmo JSON que mandou no post para atualizar a entrada, estoques e ou lotes.

#### Atualiza uma entrada já cadastrada

```http
  DELETE /api/v1/product_entry/:id
```

Deleta uma entrada e seus aninhamentos.

#### Retorna todas os stoques cadastrados

```http
  GET /api/v1/stock
```

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
|  |  | **Obrigatório**. Nenhum |

#### Retorna um estoque em específico

```http
  GET /api/v1/stock/${id}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Obrigatório**. O ID do item que você quer |

#### Atualiza uma entrada já cadastrada

```http
  PATCH ou PUT /api/v1/stock/:id
```

Espera um JSOM no Body da request neste formado:

```json
  {
    "stock": {
        "name":"Estoque Bezerra Tratamento"
    }
}
```

#### Retorna todas os lotes cadastrados

```http
  GET /api/v1/batch
```

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
|  |  | **Obrigatório**. Nenhum |

#### Retorna um estoque em específico

```http
  GET /api/v1/batch/${id}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Obrigatório**. O ID do item que você quer |

#### Atualiza uma entrada já cadastrada

```http
  PATCH ou PUT /api/v1/batch/:id
```

Espera um JSOM no Body da request neste formado:

```json
  {
    "batch": {
        "name":"Cafe Entressafra",
        "weight":"200",
        "meditate_unit":"toneladas"
    }
}
```
## Apêndice

Versões usadas neste projéto:

`Ruby version ruby 2.5.8p224`

`Rvm version rvm 1.29.12 (manual)`

`Bundle version 1.17.3`

Para que o projeto esteja funcional rode na sequencia:

`bundle install`

`rails db:create`

`rails db:migrate`