FROM hugomods/hugo:latest AS builder
WORKDIR /site
COPY . .

# Remove existing public directory so it's always rebuilt
RUN rm -rf public 
RUN hugo --minify

FROM nginx:alpine
COPY --from=builder /site/public /usr/share/nginx/html
EXPOSE 80