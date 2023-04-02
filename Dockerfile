FROM python:3.9-alpine3.15

RUN apk update && apk upgrade && apk --no-cache add curl unzip libc6-compat

RUN apk --no-cache add firefox-esr xvfb

RUN curl -sSL https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz | tar xz -C /usr/local/bin

ENV export DISPLAY=:0
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN Xvfb :0 -screen 0 1024x768x16 &

WORKDIR /screen/

# Copying the folder to the container
COPY . .

# installing the python packages for the app
RUN pip3 install -r requirements.txt

# Running the app
RUN chmod +x screenshot.py
CMD [ "python3", "screenshot.py" ]