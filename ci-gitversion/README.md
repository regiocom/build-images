# regiocom/ci-gitversion

## Usage

Run it as a setup job to create `shared-vars.env` file containing info about current version.

```yaml
variables:
  CONTAINER_BASE_NAME: gitlab.com/my-group/my-repo/

shared-vars:
  image: regiocom/ci-gitversion
  stage: setup
  script:
    - create-shared-vars.sh
  artifacts:
    reports:
      # Pass shared variables as environment variables to next jobs
      dotenv: shared-vars.env
    paths:
      # Pass shared variables as file to next jobs
      - shared-vars.env
```

### Specifying a custom GitVersion.yml configuration

A path to a custom GitVersion configuration file may be specified by setting the environment variable 
`GIT_VERSION_CONFIG_PATH`.

```yaml
variables:
  CONTAINER_BASE_NAME: gitlab.com/my-group/my-repo/

shared-vars:
  image: regiocom/ci-gitversion
  stage: setup
  variables: 
    GIT_VERSION_CONFIG_PATH: "./GitVersion.yml"
  script:
    - create-shared-vars.sh
  artifacts:
    reports:
      # Pass shared variables as environment variables to next jobs
      dotenv: shared-vars.env
    paths:
      # Pass shared variables as file to next jobs
      - shared-vars.env
```