FROM alpine:3.14
RUN apk add --no-cache texlive-full
RUN apk add inkscape
COPY . .
CMD ["./build.sh"] 