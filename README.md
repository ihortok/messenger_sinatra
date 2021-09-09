# Messenger

A tool for chatting with friends

## Troubleshooting

MacOS: pg gem installing issue
```bash
An error occurred while installing pg (1.2.3), and Bundler cannot continue.
Make sure that `gem install pg -v '1.2.3' --source 'https://rubygems.org/'` succeeds before bundling.
```

Fix:
```bash
brew install libpq
gem install pg -- --with-pg-config=/usr/local/opt/libpq/bin/pg_config
```
