FROM ruby:latest

# Actualizar e instalar dependencias necesarias, incluido PostgreSQL y Node.js
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client

# Configurar git
RUN git config --global user.name "Alexis026-Ae"
RUN git config --global user.email "bily.alarcon@unas.edu.pe"

# Configurar el directorio de trabajo
WORKDIR /usr/src/app

# Instalar Rails versión 8.0
RUN gem install rails -v 8.0

# Exponer el puerto 3000
EXPOSE 3000
