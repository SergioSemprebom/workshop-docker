# Imagem base
FROM python:3.13

# Instalar o Poetry
RUN pip install poetry

# Definir variáveis de ambiente
ENV POETRY_VIRTUALENVS_CREATE=0 \
    POETRY_NO_INTERACTION=1 \
    POETRY_CACHE_DIR=/var/cache/pypoetry

# Copiar apenas os arquivos de configuração do Poetry primeiro
COPY pyproject.toml poetry.lock /src/

# Definir o diretório de trabalho
WORKDIR /src

# Instalar as dependências com o Poetry
RUN poetry install --no-dev --no-ansi

# Copiar o restante do código do projeto
COPY . /src

# Expor a porta do Streamlit
EXPOSE 8501

# Definir o ponto de entrada
ENTRYPOINT [ "poetry", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0" ]


