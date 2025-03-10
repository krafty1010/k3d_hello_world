
FROM python:3.9
WORKDIR /app
COPY requirements.txt main.py ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8081
CMD ["python", "main.py"]