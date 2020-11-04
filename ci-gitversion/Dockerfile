ARG gitversion
FROM  gittools/gitversion:${gitversion}

RUN apk add --no-cache git

ADD ci-gitversion/script.sh /bin/create-shared-vars
RUN chmod +x /bin/create-shared-vars

ENTRYPOINT [ "/bin/sh", "-c"]
CMD [ "create-shared-vars" ]
