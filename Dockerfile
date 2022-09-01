
# evbda/Dockerfile
FROM python:3.9
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt
COPY . /code/

EXPOSE 8085
CMD ["uvicorn", "main:server", "--host", "0.0.0.0", "--port", "8085"]
#ENTRYPOINT [ "/code/start.sh" ]