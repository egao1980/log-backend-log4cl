# log-backend-log4cl

[log4cl](https://github.com/sharplispers/log4cl) backend for [`log-protocol`](https://github.com/egao1980/log-protocol). Not the protocol — product backends stay in their own repos.

Loading the system binds `*log-backend*` (`use-log4cl-backend`).

```lisp
(asdf:load-system "log-backend-log4cl")
(stack-log:configure :level :info :layout :text)
(stack-log:info "started" :port 8080)
```

In-protocol default writer is `stream-log-backend`. Alternate: [`log-backend-vom`](https://github.com/egao1980/log-backend-vom).

Part of [cl-stack](https://github.com/egao1980/cl-stack). Cookbook: [logging.md](https://github.com/egao1980/cl-stack/blob/main/docs/cookbooks/logging.md).

## License

MIT — see [LICENSE](LICENSE).
