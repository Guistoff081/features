#!/bin/sh
set -e

# Recebe opções do devcontainer-feature.json
POSTGIS_VERSION="${VERSION:-latest}"
PG_VERSION="${PG_VERSION:-latest}"
INSTALL_TOOLS="${INSTALLTOOLS:-true}"

echo "Installing PostGIS (version: $POSTGIS_VERSION)..."

# Atualiza e instala dependências
apt-get update
apt-get install -y gnupg2 lsb-release wget

# Adiciona repositório do PostgreSQL
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update

# Instala PostgreSQL e PostGIS
if [ "$POSTGIS_VERSION" = "latest" ] || [ "$POSTGIS_VERSION" = "" ]; then
    apt-get install -y postgis
else
    apt-get install -y postgis="$POSTGIS_VERSION"*
fi

# Instala ferramentas de linha de comando se solicitado
if [ "$INSTALL_TOOLS" = "true" ]; then
    apt-get install -y postgis
    echo "Ferramentas de linha de comando instaladas."
fi

# Teste simples
echo "PostGIS instalado:"
postgis_version=$(psql -V 2>/dev/null || echo "psql não disponível")
echo "$postgis_version"

# Limpeza
apt-get clean
rm -rf /var/lib/apt/lists/*
