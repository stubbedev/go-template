# go-template

Starting point for new Go projects: strict linting, dev recipes, and security CI already wired up.

## Start a project

```sh
git clone git@github.com:stubbedev/go-template.git myproject
cd myproject
rm -rf .git && git init -b main
# point go.mod at the new module path
sd 'github.com/stubbedev/go-template' 'github.com/stubbedev/myproject' go.mod .golangci.yml
just check
```

## Recipes

| Recipe | What it does |
| --- | --- |
| `just check` | Every release gate in order: vet, lint, test, build |
| `just vet` | Static analysis with `go vet` |
| `just lint` | `golangci-lint run` against the strict config in `.golangci.yml` |
| `just test` | `go test ./...` |
| `just build` | Compile-check every package |
| `just fmt` | Format every Go source in place |

## CI

`.github/workflows/security.yml` runs CodeQL (Go and GitHub Actions), Grype and
govulncheck, uploading findings to code scanning; dependency review gates
pull requests. Dependabot keeps the module and the workflows current.

## Linting

`.golangci.yml` starts from the standard linter set and layers on bodyclose,
copyloopvar, errorlint, gosec, intrange, misspell, modernize, nolintlint,
perfsprint, revive, unconvert, unparam, usestdlibvars and whitespace, with
gofumpt and gci as formatters. No issue caps: every finding fails the build.
