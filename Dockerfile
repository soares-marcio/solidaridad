FROM ruby:2.4.2-slim
# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick libmagickwand-dev
# Seta nosso path
ENV INSTALL_PATH /solidaridad
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Ignora a instalação da documentação das gems
RUN echo 'gem: --no-rdoc --no-ri' >> "$INSTALL_PATH/.gemrc"
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
# Seta o path para as Gems
ENV BUNDLE_PATH /box
# Copia nosso código para dentro do container
COPY . .