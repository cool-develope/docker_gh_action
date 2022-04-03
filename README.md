# docker_gh_action
This project is for docker github action test to download the private module using secrets.


## Local Build
Create the `secret` file with your personal github token.

```cmd
DOCKER_BUILDKIT=1 docker build -t test_gh --no-cache --progress=plain --secret id=github_token,src=secret .
```