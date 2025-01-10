# Cheatsheet for mkdocs & mkdocs-material

## Material theme

In `mkdocs.yml`

```yaml
theme:
  name: material
```

## Features

In `mkdocs.yml`, enable **admonitions**, **annotations**, **code highlightnings**

```yaml
markdown_extensions:
  - pymdownx.highlight:
      anchor_linenums: true
      line_spans: __span
      pygments_lang_class: true
  - attr_list
  - md_in_html      
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.superfences
  - admonition
  - pymdownx.details
```

also for ease code snippet usage, add features in `theme` part

```yaml
  features:
    - content.code.copy
    - content.code.annotate
```

## Usage

### Annotations

```md
Lorem ipsum dolor sit amet, (1) consectetur adipiscing elit.
{ .annotate }

1.  😝 I'm an annotation! (1)
    { .annotate }

    1.  🤯 I'm an annotation in an annotation
```

### Admonitions

Available keywords are : `note`, `abstract`, `info`, `tip`, `success`, `question`, `warning`, `failure`, `danger`, `bug`, `example`, `quote`.
Admonition are displayed by default, but can be replace by collapsible block switching from `!!!` to `???`

```md
!!! warning
    Beware of the wolf 🐺
```

It supports `annotation`:

```md
??? bug annotate
    this a 🐞 (1)

1.  only in a specific version
```

### Code blocks

Code blocks are of course supported, but you can also add either a title or annotation.

ℹ️ The comment is mandatory for the annotation to be processed. Here `#` in a yaml file.

```md
\`\`\`yaml
  annotations: # (1)
    downscaler/uptime: Mon 07:30-18:00 CET
    downscaler/force-downtime: "true"
\`\`\`

1. 🥶 Incredible annotation   
```

### Snippets

We can include files as snippets, with an optional title:

```md
\```yaml title="a simple deployment sample"
--8<-- "demos/simple-deployment.yml"
\```
```

## Build

Pour installer mkdocs et les extensions:

### Avec un virtualenv

```bash	
python3 -m venv ./.venv
source .venv/bin/activate
```

```bash
pip install -r requirements.txt
```

Pour lancer le serveur de dev:

```bash
mkdocs serve --clean
```

Pour lancer un build et générer le pdf
```bash
mkdocs build
```
