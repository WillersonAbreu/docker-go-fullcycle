FROM golang:1.23.1-alpine AS builder
WORKDIR /app
COPY ./src .
RUN go build -ldflags "-s -w" -o main .

FROM scratch
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT [ "./main" ]