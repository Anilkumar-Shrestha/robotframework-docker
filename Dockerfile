From python:3

MAINTAINER Anil Kumar Shrestha <nl.shrestha90@gmail.com>
# setting working directory to project for the container
WORKDIR /project
# copy all the files to the project folder( uses dockerignore to ignore the unnecessary files)
COPY . /project

RUN apt-get update \
	&& apt-get install -y build-essential libssl-dev libffi-dev python-dev \
		xvfb zip wget ca-certificates ntpdate \
		libnss3-dev libasound2 libgbm1 libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation \
	&& rm -rf /var/lib/apt/lists/*


# Update system path
#ENV PATH=/project/drivers:$PATH

# Lets make sure pip is the latest version
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install robotframework && \
    python3 -m pip install robotframework-seleniumlibrary && \
    python3 -m pip install robotframework-requests && \
    python3 -m pip install robotframework-jsonlibrary && \
    python3 -m pip install robotframework-xvfb


# install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
	&& dpkg -i google-chrome*.deb \
	&& rm google-chrome*.deb \
    && wget -q https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip \
	&& unzip chromedriver_linux64.zip \
	&& rm chromedriver_linux64.zip \
	&& mv chromedriver /usr/local/bin \
	&& chmod +x /usr/local/bin/chromedriver

RUN mkdir -p testresults/
VOLUME /project/testresults

CMD ["robot","--outputdir","testresults/","googletest.robot"]