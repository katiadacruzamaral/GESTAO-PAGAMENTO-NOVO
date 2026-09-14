# Gestão de Folha Compartilhada

Aplicação web estática em português para controle de funcionários, lançamentos mensais, cadastros, horas por filial e cálculos auxiliares de folha. A interface original enviada foi preservada e ganhou sincronização compartilhada com Supabase.

## Arquivos

- `index.html`: aplicação completa.
- `config.js`: URL e chave pública do Supabase.
- `supabase-schema.sql`: tabela e políticas necessárias.
- `seed-data.json`: estado inicial opcional.
- `migration-sales.json`: roteiro de migração do armazenamento local.
- `vercel.json`: configurações básicas de publicação.

## Impressão dos lançamentos mensais

Na tela **Lançamentos mensais**, selecione o ano e o mês desejados e clique em **Imprimir lançamentos do mês**. O relatório de impressão reúne os lançamentos do período com data, funcionário, filial, tipo, categoria/detalhe, valor e observação, além dos totais de receitas/horas, despesas/descontos e resultado do mês. O layout é otimizado para papel A4 em orientação paisagem e não exibe os controles da aplicação na impressão.

## Configuração do Supabase

1. Abra o projeto `https://wvtclyiaxqbrqghsnjou.supabase.co`.
2. No SQL Editor, execute todo o conteúdo de `supabase-schema.sql`.
3. Opcionalmente, insira `seed-data.json` na linha `id = 'main'` da tabela `public.app_state`.
4. Confirme que `config.js` contém a URL e a chave `sb_publishable` fornecidas para este projeto.

A aplicação usa `localStorage` como fallback e sincroniza a linha única `main` quando o Supabase está disponível. O navegador carrega os dados compartilhados na abertura e grava alterações com pequeno atraso para evitar excesso de requisições.

## Publicação no GitHub e Vercel

1. Crie um repositório no GitHub.
2. Envie todos os arquivos desta pasta para a raiz do repositório.
3. No Vercel, importe o repositório.
4. Use a raiz do projeto como diretório e não informe comando de build: é um site estático.
5. Publique e abra a URL gerada.

## Importante sobre acesso

Esta configuração atende a um único usuário/espaço compartilhado e usa a chave pública do Supabase no navegador. Como as políticas permitem leitura e escrita anônimas na linha `main`, qualquer pessoa que obtenha a URL poderá alterar os dados. Para uso com dados pessoais reais, adicione autenticação Supabase e políticas RLS por usuário antes de compartilhar a URL publicamente.
