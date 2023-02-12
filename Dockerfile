FROM alpine:3.14
RUN apk add --no-cache texlive-full
RUN apk add inkscape

# docker build -t latex .
# docker run -it --rm -v "$(pwd)":/app -w /app latex bash -c "./build.sh"
