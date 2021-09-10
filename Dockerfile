FROM alpine:3.14
EXPOSE 22
COPY ./startsshd.sh ~/startsshd.sh

RUN apk add --no-cache openssh \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd

RUN apk add --no-cache py3-pip py3-grpcio py3-protobuf py3-psutil py3-numpy git
RUN ln -sf python3 /usr/bin/python && ln -sf pip3 /usr/bin/pip
RUN python3 -m pip install psutil

RUN ["chmod", "+x", "~/startsshd.sh"]
ENTRYPOINT ["~/startsshd.sh"]