# Has The Rapture Happened? - Hugo Website

A Hugo website with a custom theme featuring a large background image, floating title, and recent post display with fade-in animation.

## Features

- **Large Background Image**: Full-screen background image with overlay for text readability
- **Floating Title**: Animated title positioned in the top third of the page
- **Recent Post Display**: Most recent blog post fades in after 3 seconds
- **Audio Autoplay**: Background MP3 file plays automatically when page loads
- **Responsive Design**: Mobile-friendly layout that adapts to different screen sizes

## Setup Instructions

1. **Replace Background Image**: 
   - Replace `static/images/background.jpg` with your desired background image
   - Recommended dimensions: 1920x1080 or higher
   - The image will be displayed as a full-screen background
   - Currently uses a beautiful gradient background as placeholder

2. **Add Audio File**:
   - Replace `static/audio/background.mp3` with your desired audio file
   - The audio will autoplay when the page loads (with fallback for browsers that block autoplay)
   - Audio volume is set to 30% for comfortable listening

3. **Customize Content**:
   - Edit `hugo.toml` to change the site title and other settings
   - Add more blog posts in the `content/posts/` directory
   - Modify the theme files in `themes/custom/` for further customization

4. **Ready to Use**:
   - The site is fully functional with sample content
   - Includes SEO optimization and social media meta tags
   - Responsive design works on all devices

## Running the Site

```bash
# Start the Hugo development server
hugo server --buildDrafts

# Build the site for production
hugo --minify
```

## File Structure

```
├── content/posts/          # Blog posts
├── static/
│   ├── images/            # Background image
│   └── audio/             # Background audio
├── themes/custom/         # Custom theme
│   ├── layouts/           # HTML templates
│   └── assets/css/        # Custom styles
└── hugo.toml             # Site configuration
```

## Customization

The theme is built with clean, semantic HTML and CSS. Key files to modify:

- `themes/custom/layouts/home.html` - Home page layout
- `themes/custom/assets/css/main.css` - Styling and animations
- `hugo.toml` - Site configuration and parameters

## Browser Compatibility

The site uses modern CSS features including:
- CSS Grid and Flexbox
- CSS animations and transitions
- Backdrop filters (with fallbacks)
- Custom properties

Supported in all modern browsers (Chrome, Firefox, Safari, Edge).
