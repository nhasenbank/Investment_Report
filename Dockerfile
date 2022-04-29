FROM python as build

RUN pip install nbconvert

RUN mkdir /build &&\
    cd /build

ARG NOTEBOOK="Weekly_Crypto_Summary"
COPY $NOTEBOOK.ipynb /build/$NOTEBOOK.ipynb
RUN jupyter nbconvert --to script /build/$NOTEBOOK.ipynb

FROM python as run

COPY requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt

ARG NOTEBOOK="Weekly_Crypto_Summary"
ENV TARGETSCRIPT=/opt/$NOTEBOOK.py
COPY --from=build /build/$NOTEBOOK.py $TARGETSCRIPT
RUN chmod +x $TARGETSCRIPT

WORKDIR /opt

ENTRYPOINT [ "/bin/bash", "-c", "python $TARGETSCRIPT" ]
