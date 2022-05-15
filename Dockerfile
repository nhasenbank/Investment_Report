FROM python as build

### prepare venv to be able to copy it to the runtime image
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

### get and build all python requirements
RUN pip install --upgrade pip
COPY requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt

### generate python script from jupyter notebook
RUN pip install nbconvert

RUN mkdir /build &&\
    cd /build

ARG NOTEBOOK="Investment_Report"
COPY $NOTEBOOK.ipynb /build/$NOTEBOOK.ipynb
RUN jupyter nbconvert --to script /build/$NOTEBOOK.ipynb

### ----------------------
### prepare minimal runtime image
### ----------------------
FROM python as run

### install crontab
RUN apt-get update &&\
    apt-get install -y cron gettext moreutils &&\
    rm -rf /var/lib/apt/lists/*

### copy requirements
COPY --from=build /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

### copy code
ARG NOTEBOOK="Investment_Report"
ENV TARGETSCRIPT=/opt/$NOTEBOOK.py
COPY --from=build /build/$NOTEBOOK.py $TARGETSCRIPT
RUN chmod +x $TARGETSCRIPT

### setup scripts
ENV STARTSCRIPT=/opt/scripts/startup.sh
ENV RUNSCRIPT=/opt/scripts/run.sh
ENV LOGFILE=/opt/$NOTEBOOK.cron.log
COPY ./scripts/startup.sh $STARTSCRIPT
COPY ./scripts/run.sh $RUNSCRIPT
RUN chmod 755 $STARTSCRIPT &&\
    chmod 755 $RUNSCRIPT

### setup scheduled execution
COPY ./crontab /opt/crontab
RUN touch $LOGFILE &&\
    envsubst < /opt/crontab > /opt/crontab.tmp &&\
    mv /opt/crontab.tmp /opt/crontab &&\
    crontab /opt/crontab

WORKDIR /opt

CMD [ "/bin/bash", "-c", "$STARTSCRIPT" ]
