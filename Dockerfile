FROM debian:buster as builder

RUN apt update && apt install gcc -fy
COPY myapp.c myapp.c
RUN gcc myapp.c -static -o myapp

FROM scratch

COPY --from=builder /myapp /myapp
CMD ["/myapp"]

