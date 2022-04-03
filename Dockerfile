# CONTAINER FOR BUILDING BINARY
FROM golang:1.17 AS build

ENV CGO_ENABLED=1
ARG PRIVATE_TOKEN
# INSTALL DEPENDENCIES
COPY go.mod go.sum /src/
RUN git config --global url."https://${PRIVATE_TOKEN}:x-oauth-basic@github.com/".insteadOf "https://github.com/"
RUN cd /src && go mod download

# BUILD BINARY
COPY . /src
RUN cd /src && make build

# CONTAINER FOR RUNNING BINARY
FROM golang:1.17
WORKDIR /app
COPY --from=build /src/dist/docker_gh /app/docker_gh
EXPOSE 9090
EXPOSE 8080
CMD ["./docker_gh"]
