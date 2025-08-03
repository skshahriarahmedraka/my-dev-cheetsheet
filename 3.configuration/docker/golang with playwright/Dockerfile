ARG GO_VERSION=1.24
# ===================================================
# ---- Stage: Build ----
# ===================================================
FROM golang:${GO_VERSION} AS build
ARG TARGET_FILE
WORKDIR /app

# Install C compiler for CGO (required for Go plugins)
RUN apt-get update && apt-get install -y gcc libc6-dev && rm -rf /var/lib/apt/lists/*
COPY go.mod go.sum ./
RUN --mount=type=cache,target=/go/pkg/mod/ \
    go mod download -x
COPY build_plugins.sh .
COPY site_configs/ ./site_configs/
COPY internal/ ./internal/
# NOTE: Build plugins for all sites that have plugins
RUN --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=cache,target=/go/pkg/mod \
    for site_dir in site_configs/*/; do \
        site_key=$(basename "$site_dir"); \
        if [ -d "${site_dir}plugins" ]; then \
            ./build_plugins.sh "$site_key"; \
        fi; \
    done
COPY . .
RUN --mount=type=cache,target=/go/pkg/mod/ \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=1 GOOS=$TARGETOS GOARCH=$TARGETARCH \
    go build -v -o /bin/main $TARGET_FILE

# ===================================================
# ---- Stage: Playwright Install ----
# ===================================================
FROM golang:${GO_VERSION} AS playwright
WORKDIR /app
COPY go.mod ./
RUN go run github.com/playwright-community/playwright-go/cmd/playwright@$(cat go.mod | grep playwright | grep -o "v[0-9.]*") install --with-deps && \
    mkdir -p /home/.cache && \
    cp -r /root/.cache/ms-playwright* /home/.cache/

# ===================================================
# ---- Stage: Deps (Browser libraries) ----
# ===================================================
FROM debian:bookworm-slim AS deps
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
    apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    fonts-liberation \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libavif15 \
    libcairo2 \
    libdbus-1-3 \
    libdrm2 \
    libegl1 \
    libepoxy0 \
    libevdev2 \
    libevent-2.1-7 \
    libfontconfig1 \
    libfreetype6 \
    libgbm1 \
    libgdk-pixbuf-2.0-0 \
    libgles2 \
    libglib2.0-0 \
    libgraphene-1.0-0 \
    libgstreamer-gl1.0-0 \
    libgstreamer-plugins-bad1.0-0 \
    libgstreamer-plugins-base1.0-0 \
    libgstreamer1.0-0 \
    libgtk-3-0 \
    libgudev-1.0-0 \
    libharfbuzz-icu0 \
    libharfbuzz0b \
    libhyphen0 \
    libicu72 \
    libjpeg62-turbo \
    liblcms2-2 \
    libnss3 \
    libopenjp2-7 \
    libopus0 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpangoft2-1.0-0 \
    libpng16-16 \
    libsecret-1-0 \
    libsoup-3.0-0 \
    libvpx7 \
    libwayland-client0 \
    libwayland-egl1 \
    libwayland-server0 \
    libwebp7 \
    libwebpdemux2 \
    libwoff1 \
    libx11-6 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxinerama1 \
    libxkbcommon0 \
    libxml2 \
    libxrandr2 \
    libxrender1 \
    libxslt1.1 \
    libxtst6 \
    tzdata \
    libc6 \
    && rm -rf /var/lib/apt/lists/*

# Create nonroot user
RUN useradd -m -u 1000 nonroot

# ===================================================
# ---- Stage: Final ----
# ===================================================
FROM deps AS final
WORKDIR /app
ENV PLAYWRIGHT_BROWSERS_PATH=/home/nonroot/.cache/ms-playwright
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# Copy .env file first (as root)
COPY --from=build /app/.env .env

# Copy playwright cache
COPY --from=playwright --chown=nonroot:nonroot /home/.cache /home/nonroot/.cache

# Copy site_configs with proper permissions for .so files
COPY --from=build --chown=nonroot:nonroot /app/site_configs ./site_configs

# Ensure .so files have executable permissions
RUN find ./site_configs -name "*.so" -exec chmod +x {} \; || true

# Copy the main binary
COPY --from=build /bin/main .

# Make sure the main binary is executable
RUN chmod +x ./main

# Switch to nonroot user
USER nonroot:nonroot

EXPOSE 8080
CMD ["./main"]
