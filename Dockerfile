FROM maven as builder
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN mvn compile

FROM java:8
COPY --from=builder /app/demo.jar /

EXPOSE 8088
CMD java demo.jar

