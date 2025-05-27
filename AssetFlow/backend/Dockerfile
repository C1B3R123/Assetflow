# backend/Dockerfile

# Usar a imagem oficial do Ruby com Alpine para um tamanho menor
FROM ruby:3.3.0-alpine

# Instalar dependências de sistema (específicas para Rails e PostgreSQL)
RUN apk add --no-cache build-base nodejs npm postgresql-dev tzdata

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o Gemfile e Gemfile.lock primeiro para aproveitar o cache do Docker
COPY backend/Gemfile backend/Gemfile.lock /app/

# Instalar as gems
RUN bundle install --jobs 4 --retry 3

# Copiar o restante do código da aplicação
COPY backend/ /app/

# Expor a porta que o Rails vai usar
EXPOSE 3000

# Comando para iniciar o servidor Rails
# Certifique-se de que o servidor escute em todas as interfaces (0.0.0.0)
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]