# regiocom/ci-gitversion

## Usage

Run it as a setup job to create `shared-vars.sh` file containing info about current version.

```yaml
variables:
  CONTAINER_BASE_NAME: gitlab.com/my-group/my-repo/

shared-vars:
  image: regiocom/ci-gitversion
  stage: setup
  script:
    - create-shared-vars
  artifacts:
    paths:
      - shared-vars.sh
```

Use it durring another job

```yaml
build_go:
  stage: build
  image: regiocom/ci-golang
  before_script:
    # LOAD the env variables
    - ./shared-vars.sh
  script:
    - ...
```

Exported VARS:

```bash
export GIT_VERSION=0.1.0-add-ci-pipeline.18
export IMAGE_VERSION_TAG=gitlab.com/my-group/my-repo/$CONTAINER_IMAGE_NAME:$GIT_VERSION
export GOPRIVATE=gitlab.com/vlekapp/framework
```