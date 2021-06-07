ARG gitversion
FROM  gittools/gitversion:${gitversion}

# Add default GitVersion configuration
ENV GIT_VERSION_CONFIG_PATH = "/tools/GitVersion.yml"
COPY ci-gitversion/GitVersion.yml /tools/GitVersion.yml

# Install git
RUN apk add --no-cache git

# Copy default command script
COPY ci-gitversion/script.sh /bin/create-shared-vars.sh
RUN chmod +x /bin/create-shared-vars.sh

ENTRYPOINT [ "/bin/sh", "-c"]
CMD [ "create-shared-vars.sh" ]