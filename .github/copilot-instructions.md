# Copilot Instructions

## Project Overview

This is a static personal homepage and online resume for Joonhun Lee. The site consists of two main pages:

- **index.html**: Portfolio homepage with sections for About, Experience, Education, Publications, Skills, Organizations, and Interests
- **resume.html**: Formatted online resume optimized for reading and printing

Both pages are pure HTML/CSS with minimal JavaScript, deployed as static files.

## Architecture

### Page Structure

Both HTML files follow a similar pattern:
- External CDN-based dependencies (Font Awesome, Bootstrap, devicon, academicons, Office UI Fabric)
- Inline Google Analytics tracking
- Custom CSS in `static/css/` (home.css for index, resume.css for resume)
- Minimal JavaScript in `static/js/home.js` (Bootstrap ScrollSpy and navbar collapse)

### Key Files

- `index.html` - Main homepage with full portfolio content
- `resume.html` - Print-optimized resume format
- `static/css/home.css` - Styles for homepage
- `static/css/resume.css` - Styles for resume page
- `static/js/home.js` - Bootstrap ScrollSpy initialization
- `scripts/update_resume.sh` - Pre-commit hook script
- `.pre-commit-config.yaml` - Pre-commit hook configuration

### Content Synchronization

The homepage and resume contain overlapping information but are maintained separately. When updating professional experience, education, or publications, update both files to maintain consistency.

### Assets Directory

- `assets/document/` - PDF documents (e.g., CFA certificate)
- `assets/favicon/` - Favicon images
- `assets/image/` - Profile and other images

## Development Conventions

### Content Updates

- **Experience/Education/Publications**: Update content in both `index.html` and `resume.html`
- **Dates**: Use abbreviated format (e.g., "Dec '23 - Present", "Mar '22 - Feb '24")
- **Links**: All external links should include `rel="noopener noreferrer" target="_blank"`
- **Commented sections**: Some sections are commented out (e.g., TOBE Labs experience). Keep these for potential future use.

### Resume Date Management

The resume footer date is automatically updated by a pre-commit hook (`scripts/update_resume.sh`) whenever `resume.html` is committed. The script:
- Detects if `resume.html` is staged for commit
- Updates the footer to reflect the current date with ordinal suffix (e.g., "February 6th, 2026")
- Re-stages the file

**Do not manually edit the footer date** - let the pre-commit hook handle it.

### HTML Formatting

- Use 2-space indentation
- Keep semantic HTML structure with clear section elements
- Maintain proper heading hierarchy (h1 → h2 → h3)
- Use descriptive class names matching the content structure

### Analytics

Both pages include Google Analytics (tracking ID: G-ZJV9RRC4C5). Keep the GA snippets intact when modifying the pages.

## Testing

No automated tests exist. To verify changes:

1. Open the HTML files directly in a browser
2. Check responsive behavior at different viewport sizes
3. Verify all links work correctly
4. For resume.html, test print layout (Cmd/Ctrl + P)

## Deployment

This appears to be a GitHub Pages site (based on CNAME file). Changes to the main branch are automatically deployed. The custom domain is configured via the CNAME file.
