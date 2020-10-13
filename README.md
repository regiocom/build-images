# Build-Images
A collection of useful docker base images

## Creating a Dockerfile
In order to add a `Dockerfile` which can be automatically published to its corresponding repository at [Dockerhub](https://hub.docker.com/) 
all that needs to be done is adding a new directory containing a `Dockerfile` and a `versions.json` as described below.
The directory name corresponds to the `regiocom/{directory name}` repository at Dockerhub.

## Versions
The file named `versions.json` mainly describes the versions of a Dockerfile that will be build and published automatically on a release.
A typical `versions.json` looks like the following:

```json
{
  "include": [
    {
      "name": "lts",
      "dependencies": {
        "docker_compose": "1.27.2",
        "node": "12.x",
        "go": "1.14.9"
      }
    },
    {
      "name": "latest",
      "dependencies": {
        "docker_compose": "1.27.4",
        "node": "14.x",
        "go": "1.15.2"
      }
    }
  ]
}
```

As one can see two image versions of the `Dockerfile` defined in the `versions.json` will be build.
Both versions will be subtagged with their corresponding name (here: `lts` or `latest`).
The dependencies section of the JSON describes the build arguments that will be passed to the docker build.
The build arguments will be named after the keys in the dependencies section (i.e. `docker_compose`, `go` and `node`).

## Tags
The tags of the final images typically consist of three parts.
1. directory name (corresponds to first part of the release tag)
2. release version (corresponds to the second part of the release tag)
3. version name (specified in `versions.json`)

## Releasing Docker Images
In order to release the versions of the docker image to the regiocom repository [Dockerhub](https://hub.docker.com/) all that is left to be done is creating a github release.
The tag of the release has the following format: `{directory name}/{release version}` e.g. `frontend/v1`.
After publishing the release the `docker-publish` github workflow will be executed which builds the Dockerfile in the directory specified by the release tag in all versions specified in the corresponding `versions.json`.
The resulting images will then be tagged in the following formats:
- `regiocom/{directory name}:{release version}-{version name}`
- `regiocom/{directory name}:-{version name}`

The resulting tags will consequently be published to the repository at [Dockerhub](https://hub.docker.com/repository/docker/regiocom/build-images).

If the version name is equal to `latest` the resulting image will additionally be tagged with:
- `regiocom/{directory name}:{release version}`