ARG gitversion
FROM  gittools/gitversion:${gitversion}

RUN apk add --no-cache git

ADD script.sh /script.sh

ENTRYPOINT [ "/bin/sh" ]
CMD [ "/script.sh" ]
