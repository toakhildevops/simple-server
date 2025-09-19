#Build Stage
FROM golang:1.21-alpine AS build
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o main .

#Run Stage
FROM gcr.io/distroless/base-debian12 AS final
WORKDIR /app
COPY --from=build /app/main .
COPY --from=build /app/templates ./templates
COPY --from=build /app/public ./public
EXPOSE 8080
CMD ["./main"]