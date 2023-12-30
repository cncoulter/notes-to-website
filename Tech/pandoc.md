---
title: Pandoc
---

# Pandoc

Pandoc is an amazing command-line utility that can convert many text-based files from one format to another. You can feed it Markdown files, Word documents, HTML files, and more, and it can convert those into Markdown files, Word documents, HTML files, PDF files, EPUB documents, even PowerPoint presentations, and more. Pandoc can even handle academic citations.

Read more about Pandoc at <https://pandoc.org>.

## How to use Pandoc

For more details, view the [Pandoc User Guide](https://pandoc.org/MANUAL.html).

Here's the simplest way to run Pandoc:

```
$ pandoc input.md -o output.html
```

That will read your input file and convert it to an HTML output file. If you want to produce a PDF, Word document, EPUB document, or something else, just change the output's file extension. For example, to convert your Markdown file into a PDF, run this:

```
$ pandoc input.md -o output.pdf
```
