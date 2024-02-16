# Stage 1: Build stage
FROM public.ecr.aws/docker/library/python:3.10-slim as builder
#FROM python:alpine3.19 as builder

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src src

# Stage 2: Production stage
FROM builder

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /app/src/* /app/src/
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
            CMD curl -f http://localhost:5000/health || exit 1
ENTRYPOINT ["python", "./src/app.py" ]
