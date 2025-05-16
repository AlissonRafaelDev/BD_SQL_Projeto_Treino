# BD_SQL_Projeto_Treino
# 🏋️‍♂️ Projeto Personal Trainer - Banco de Dados

Este repositório contém a estrutura completa do banco de dados para o sistema **Personal Trainer**, um aplicativo de gerenciamento de treinos e acompanhamento físico desenvolvido em grupo para a faculdade.  

## 📊 Estrutura do Banco de Dados
### **Tabelas Principais**
| Tabela               | Descrição                                  | Relacionamentos Chave          |
|----------------------|-------------------------------------------|-------------------------------|
| `atleta`             | Armazena dados dos usuários/alunos        | `plano_exercicio`, `acompanhamento` |
| `profissional`       | Registro de treinadores                   | `Treino`, `acompanhamento`    |
| `Treino`             | Planos de treino personalizados           | `exercicio`, `plano_exercicio`|
| `exercicio`          | Exercícios disponíveis no sistema         | `plano_exercicio`             |
| `cardapio`           | Dietas recomendadas                       | `alimento`                    |



## 🛠 Tecnologias Utilizadas
- **SGBD**: PostgreSQL (hospedado no [Neon.tech](https://neon.tech))
- **Ferramentas**:  
  - `pg_dump` para backup (arquivo `bid_ireino.sql`)   
  - Neon.Tech para consultas e testes locais  

## 📂 Arquivos Importantes
- [`bd_treino.sql`](/bd_treino.sql): Script SQL completo com criação de tabelas, atributos e relações.  
- [`docs/esquema.md`](/docs/esquema.md): Documentação detalhada dos campos (ex: tipos de dados, constraints).  

## 👨‍💻 Contribuições
- **Desenvolvedor do BD**: [Alisson Rafael ]([https://github.com/AlissonRafaelDev])
  - Criação das tabelas e relações [Victor Hugo Fedatto]((https://github.com/vhfedatto))
  - Revisão e acompanhamento e ajustes [Alexandre Luna]
  - Normalização para evitar redundâncias  
  - Dados fictícios para testes (`INSERT`s iniciais)  

## 🔌 Como Usar
1. **Restaurar o banco localmente**:
   ```bash
   psql -U seu_usuario -d nome_banco -f bid_ireino.sql
