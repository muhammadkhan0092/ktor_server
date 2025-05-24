FROM gradle:8.4-jdk17 AS builder
COPY . /app
WORKDIR /app
RUN gradle installDist

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/build/install/ktor-sample-app /app
CMD ["./bin/ktor-sample-app"]
