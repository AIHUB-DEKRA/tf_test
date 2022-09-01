
# evbda/Dockerfile
FROM python:3.9
RUN apt update -y && apt install -y  --no-install-recommends \
    android-tools-adb \
    apksigner \
    checksec \
    binutils \
    zip \
    unzip \
    net-tools \
    iputils-ping
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
#RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
RUN pip install -r /code/requirements.txt
COPY . /code/

# SSH

RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x /code/start.sh
RUN chmod u+x /code/start.sh
COPY sshd_config /etc/ssh/

#EXPOSE 8083
EXPOSE 8083 2222
#CMD ["uvicorn", "cyberapk:server", "--host", "0.0.0.0", "--port", "8085"]
ENTRYPOINT [ "/code/start.sh" ]