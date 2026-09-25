# Gestão de Funcionários e Controle de Horas

Aplicação web estática em português preparada para GitHub Pages e Vercel. Não requer build nem instalação de dependências.

## Conteúdo

- `index.html`: aplicação autônoma com cadastros, data de admissão, experiência, afastamentos, advertências, lançamentos mensais e controle multi-filial.
- `vercel.json`: cabeçalhos básicos para publicação na Vercel.
- `.nojekyll`: compatibilidade com GitHub Pages.

## Publicar

**GitHub Pages:** envie os três arquivos para a raiz de um repositório; em *Settings → Pages*, publique pela branch principal e pasta raiz.

**Vercel:** importe o mesmo repositório na Vercel, mantenha o diretório raiz e deixe os comandos de build vazios.

## Dados e sincronização

O HTML usa o projeto Supabase associado à versão anterior e tenta carregar a linha `public.app_state` com `id = main`; depois sincroniza alterações entre acessos. Assim, os dados previamente lançados **continuam disponíveis se estiverem nessa linha e o acesso do Supabase estiver ativo**. Os dados não estão incorporados ao ZIP: não havia uma exportação do banco entre os materiais disponíveis para incluí-los com segurança.

Se os registros estiverem apenas no armazenamento local do domínio antigo, publicar em outro domínio não os transfere. Nesse caso, exporte o conteúdo `gestaoHorasData` do armazenamento local do navegador antigo e migre-o para o campo `payload` da linha `main` do Supabase. Não substitua uma linha existente por dados vazios.

## Privacidade

O projeto Supabase existente usa chave pública e regras que permitem acesso anônimo. Isso expõe dados pessoais e permite alterações por quem descobrir o endpoint. Restrinja a base com autenticação e políticas de acesso antes de compartilhar publicamente. Nunca coloque uma chave `service_role` no HTML.
