# Typst Resume Template

A clean, single-page resume template built with [Typst](https://typst.app). Content lives in a YAML file — no touching layout code to update your resume.

## Features

- **Content/design separation** — all text lives in `content/*.yaml`, the layout is untouched when you edit
- **Multiple variants** — point the compiler at different YAML files to generate tailored resumes (e.g. software, PM, data)
- **Tappable links** — LinkedIn and email are real PDF hyperlinks that look like normal text
- **Bundled fonts** — Lato is included, no system font install required
- **Inline formatting** — use `*bold*` and `_italic_` directly inside bullet strings

## Preview

![Resume template preview](template/template.png)

## Project Structure

```
.
├── resume.typ              # Entry point — do not edit content here
├── template/
│   └── template.typ        # Layout: header, sections, job/school/skills blocks
├── content/
│   ├── my-resume.yaml      # Your real content
│   └── template-example.yaml  # Fake-data example to reference
└── fonts/
    └── Lato/               # Bundled font (OFL license)
```

## Quickstart

**1. Install Typst**

```bash
# macOS
brew install typst

# or download from https://github.com/typst/typst/releases
```

**2. Clone and compile**

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

typst compile resume.typ --font-path fonts/
```

This outputs `resume.pdf`.

**3. Fill in your content**

Copy the example file and edit it:

```bash
cp content/template-example.yaml content/my-resume.yaml
```

Then update `resume.typ` line 12 to point to your file:

```typst
#let d = yaml(sys.inputs.at("content", default: "content/my-resume.yaml"))
```

Or pass it at compile time:

```bash
typst compile resume.typ --font-path fonts/ --input content=content/my-resume.yaml
```

## Content Reference

All content is in your YAML file. Here's what each section supports:

### Contact

```yaml
contact:
  name:     "Your Name"
  phone:    "(555) 123-4567"
  email:    "you@email.com"
  linkedin: "linkedin.com/in/yourhandle"
```

### Education

```yaml
education:
  name:   "University Name"
  date:   "May 2024"
  degree: "B.S. in Computer Science"
  gpa:    "GPA: 3.8/4.0"
  bullets:
    - "*Honors:* Dean's List"
    - "*Courses:* Algorithms, ML"
```

### Experience

```yaml
experience:
  - company:  "Company Name"
    location: "City, ST"       # optional — omit to hide
    title:    "Job Title"
    dates:    "Jan 2024 – Present"
    bullets:
      - "Did something impactful with *quantified result*"
```

Add as many jobs as you need. To show multiple roles at one company without repeating the company header, omit `company` on the second entry.

### Skills

```yaml
skills:
  - category: "Languages"
    items:    "Python, Go, TypeScript"
  - category: "Tools"
    items:    "Docker, AWS, Terraform"
```

### Projects / Achievements

```yaml
achievements:
  - title:    "Project or Award Name"
    subtitle: "Optional subtitle"       # optional
    date:     "Apr 2023"
    bullets:
      - "What you built or won"
```

## Multiple Resume Variants

Generate different PDFs from different content files without changing the template:

```bash
typst compile resume.typ --font-path fonts/ --input content=content/resume-pm.yaml -o Resume_PM.pdf
typst compile resume.typ --font-path fonts/ --input content=content/resume-swe.yaml -o Resume_SWE.pdf
```

## Inline Formatting

Bullet strings support Typst markup:

| Syntax | Result |
|--------|--------|
| `*bold text*` | **bold text** |
| `_italic text_` | *italic text* |
| `*bold* and _italic_` | mix freely |

## Customization

| What | Where |
|------|-------|
| Font | `template/template.typ` → `set text(font: ...)` |
| Font size | `template/template.typ` → `set text(size: ...)` |
| Page margins | `template/template.typ` → `set page(margin: ...)` |
| Section order | `resume.typ` — reorder the `#section(...)` blocks |
| Link color | `template/template.typ` → `show link: set text(fill: ...)` |

## License

Template code is MIT licensed. Fonts are licensed under the [SIL Open Font License](fonts/Lato/OFL.txt).
