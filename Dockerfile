FROM python:alpine
RUN apk update && \
    apk add --no-cache bash
RUN pip install tldr

ENV TLDR_COLOR_NAME="red"
ENV TLDR_COLOR_DESCRIPTION="white"
ENV TLDR_COLOR_EXAMPLE="cyan"
ENV TLDR_COLOR_COMMAND="magenta"
ENV TLDR_COLOR_PARAMETER="white"
ENV TLDR_LANGUAGE="en"
ENV TLDR_CACHE_ENABLED=1
ENV TLDR_CACHE_MAX_AGE=720
ENV TLDR_PAGES_SOURCE_LOCATION="https://raw.githubusercontent.com/tldr-pages/tldr/master/pages"
ENV TLDR_DOWNLOAD_CACHE_LOCATION="https://tldr-pages.github.io/assets/tldr.zip"

ENTRYPOINT [ "tldr" ]
CMD ["--help"]
