FROM golang:1.19.13 AS build

WORKDIR /build

COPY go.mod .

RUN GOCACHE=OFF
RUN go mod tidy
RUN go mod download
RUN go install github.com/gopherjs/gopherjs@v1.19.0-beta1

# CMD ["sh","-c", \
#     "CGO_ENABLED=0 GOOS=js GOARCH=wasm go build -o ./dist/server/go.wasm ./src/server/ \
#     && GOOS=linux gopherjs build -o ./dist/client/go.js ./src/client/   \
#     && sed -i '1ivar require = null\n' ./dist/client/go.js \
#     && rm ./dist/client/go.js.map " ]

CMD ["sh","-c", \
    "GOOS=js GOARCH=ecmascript gopherjs build -o ./dist/client/go.js ./src/client/   \
    && CGO_ENABLED=0 GOOS=js GOARCH=wasm go build -o ./dist/server/go.wasm ./src/server/   \
    && sed -i '1ivar require = null\n' ./dist/client/go.js \
    && rm ./dist/client/go.js.map " ]