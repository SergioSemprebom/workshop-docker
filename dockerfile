FROM python:3.13
RUN pip install poetry
COPY . /src
WORKDIR /src
RUN poetry install --no-root
EXPOSE 8501
ENTRYPOINT ["poetry","run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=localhost"]
# ENTRYPOINT ["poetry","run", "python", "main.py"]