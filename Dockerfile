FROM golang
WORKDIR /go/src

RUN go get gopkg.in/gorethink/gorethink.v4 && go install gopkg.in/gorethink/gorethink.v4

ADD ./entrypoint.sh .

RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["sh", "./entrypoint.sh"]

