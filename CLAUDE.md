# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Risu is a Nessus `.nessus` XML parser that converts scan data into an ActiveRecord database for vulnerability report generation. It supports SQLite and MySQL backends and generates PDF/CSV reports via a plugin-style template system.

## Common Commands

```bash
# Run all tests (SQLite in-memory)
rake test_sqlite

# Run a single test file
ruby -Itest test/unit/host_test.rb

# Build the gem
rake build

# Full release (build, checksum, tag, push)
rake release
```

**System dependencies**: ghostscript, ImageMagick (for rmagick/gruff)

## Architecture

**Entry point**: `bin/risu` → `Risu::CLI::Application`

**Key workflow**: Load YAML config → connect to DB via ActiveRecord → parse Nessus XML (SAX-based) → run post-processors → render reports via templates

**Core modules under `lib/risu/`**:

- **cli/application.rb** — Main CLI app handling config, parsing, and rendering orchestration
- **models/** — ActiveRecord models: `Host`, `Item`, `Plugin`, `Reference`, `Report`, `Policy`, etc. Models contain significant query/analysis logic (especially `Item` and `Plugin`)
- **parsers/nessus/** — SAX-based XML parser (`NessusDocument`, `NessusSaxListener`) for memory-efficient parsing of large scan files
- **parsers/nessus/postprocess/** — 30+ postprocessors that normalize parsed data (software detection, OS matching). Loaded dynamically via `PostProcessManager`
- **templates/** — 30+ Prawn-based PDF report templates. Loaded dynamically via `TemplateManager`. Custom templates can be added to `~/risu/templates/`
- **renderers/** — Output handlers: `PDFRenderer` (Prawn), `CSVRenderer`, `NilRenderer`
- **base/schema.rb** — Database schema definitions (migrations)
- **base/template_base.rb** — Base class all templates inherit from
- **graphs/** — Chart generation using Gruff (`TopVulnGraph`, `WindowsOSGraph`)

**Plugin architecture**: Both templates and post-processors are discovered and loaded dynamically at runtime, making the system extensible without modifying core code.

## Testing

- Framework: minitest + test-unit with SimpleCov coverage
- Tests in `test/unit/` (model tests) and `test/functional/` (integration tests including template rendering)
- Test database setup handled by `test_helper.rb` using SQLite in-memory
- PRs should target the `dev` branch and include unit tests for non-trivial changes
