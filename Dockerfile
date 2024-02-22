FROM registry.redhat.io/rhel7:latest

ENV BTW=/opt/bitwarden
WORKDIR /opt/bitwarden

#RUN mkdir ${BTW}
RUN chmod -R 700 ${BTW}
RUN curl -Lso "bitwarden.sh" "https://func.bitwarden.com/api/dl/?app=self-host&platform=linux" 
# ADD bitwarden.sh .
# RUN chmod 700 bitwarden.sh
# RUN ./bitwarden.sh install

RUN touch ${BTW}/exec.sh 
RUN echo '#!/bin/sh' > ${BTW}/exec.sh
#RUN echo "mkdir minio-svr" >> ${TMP}/exec.sh
#RUN echo "minio server minio-svr --console-address :9090" >> ${TMP}/exec.sh
RUN echo "echo 'Se inicio el servidor'" >> ${BTW}/exec.sh
RUN echo 'tail -f /dev/null' >> ${BTW}/exec.sh

RUN chmod +x ${BTW}/exec.sh
ENTRYPOINT $(echo ${BTW}/exec.sh)
