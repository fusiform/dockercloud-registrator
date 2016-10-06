FROM gliderlabs/alpine:3.3

COPY . /go/src/github.com/gliderlabs/registrator
RUN apk-install -t build-deps build-base go git mercurial
RUN cd /go/src/github.com/gliderlabs/registrator
RUN export GOPATH=/go
RUN go get
RUN go build -ldflags "-X main.Version=$(cat VERSION)" -o /bin/registrator
RUN rm -rf /go
RUN apk del --purge build-deps

# PUT RUN.SH IN THE RIGHT PLACE ==========

ADD run.sh /bin/registrator/run.sh
RUN chmod +x /bin/registrator/run.sh

# RUN ==========

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/registrator/run.sh"]
