# Sistema-de-Gest-o-de-Marketplace-Multivendedor-Vitrine-Global

Este repositório contém os scripts SQL do mini-mundo **Vitrine Global**, cobrindo a criação das tabelas (**DDL**) e a manipulação de dados (**DML**) com: **INSERT**, **SELECT**, **UPDATE** e **DELETE**.
A estrutura reflete o modelo lógico (DER) definido, com integridade referencial (PK/FK), restrições (UNIQUE/CHECK) e exemplos reais de manipulação de dados.

---

## 📁 Estrutura do repositório

    .
    ├─ README.md
    └─ sql/
       ├─ schema.sql
       ├─ inserts.sql
       ├─ selects.sql
       ├─ updates.sql
       └─ deletes.sql

---

## ▶️ Como executar (ordem correta)

Execute os arquivos **nesta ordem**:

1. `sql/schema.sql`
2. `sql/inserts.sql`
3. `sql/selects.sql`
4. `sql/updates.sql`
5. `sql/deletes.sql`

A ordem é importante porque:
- `schema.sql` cria as tabelas e as constraints
- `inserts.sql` depende das tabelas já existirem
- `selects.sql` valida os dados inseridos
- `updates.sql` e `deletes.sql` alteram/removem registros já existentes

---

## 🧪 Fluxo recomendado de testes

1) Rode `schema.sql`  
2) Rode `inserts.sql`  
3) Rode `selects.sql` e confira os resultados  
4) Rode `updates.sql`  
5) Rode novamente `selects.sql` para ver as alterações  
6) Rode `deletes.sql` por último

## 📌 O que cada script faz

- `schema.sql`  
  Cria as tabelas: **cidades**, **categorias**, **usuarios**, **anuncios**, **anuncio_fotos**, incluindo PK/FK, UNIQUE e CHECK.

- `inserts.sql`  
  Insere dados de exemplo para povoar as tabelas e permitir testes reais.

- `selects.sql`  
  Contém consultas com **WHERE**, **ORDER BY**, **LIMIT**, **JOIN**, **GROUP BY** e **LEFT JOIN**.

- `updates.sql`  
  Contém atualizações com condições (ex.: marcar anúncio como vendido, aplicar desconto, desativar usuário).

- `deletes.sql`  
  Contém exclusões com condições, incluindo exclusões seguras com `NOT EXISTS` e efeito de `ON DELETE CASCADE`.

---

## 🔒 Regra de negócio (autoria do anúncio)

A regra “apenas o dono do anúncio pode alterá-lo” é representada no banco pela FK:

- `anuncios.usuario_id -> usuarios.id`

Nos scripts de UPDATE, essa regra também aparece em condições do tipo:

- `WHERE id = ... AND usuario_id = ...`
