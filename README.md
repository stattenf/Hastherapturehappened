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

## Automated Deployment

This repository is configured with GitHub Actions for automated deployment. Every commit to the main branch will automatically build the Hugo site and deploy it to your webserver using rsync.

### Setup Required Secrets

To enable automated deployment, you need to configure the following secrets in your GitHub repository settings:

1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Add the following repository secrets:

| Secret Name | Description | Example |
|-------------|-------------|---------|
| `DEPLOY_HOST` | Your server's hostname or IP address | `example.com` or `192.168.1.100` |
| `DEPLOY_USER` | SSH username for your server | `ubuntu`, `www-data`, or your username |
| `DEPLOY_PATH` | Path on the server where the site should be deployed | `/var/www/html/` or `/home/user/public_html/` |
| `DEPLOY_KEY` | Private SSH key for authentication (entire key including headers) | `-----BEGIN OPENSSH PRIVATE KEY-----...` |
| `DEPLOY_PORT` | SSH port (optional, defaults to 22) | `2222` or `22` |

### SSH Key Setup

1. **Generate SSH Key Pair** (if you don't have one):
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

2. **Add Public Key to Server**:
   ```bash
   # Copy your public key to the server
   ssh-copy-id -i ~/.ssh/id_rsa.pub user@your-server.com
   
   # Or manually add it to ~/.ssh/authorized_keys on your server
   cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
   ```

3. **Add Private Key to GitHub Secrets**:
   - Copy the entire contents of your private key file (`~/.ssh/id_rsa`)
   - Paste it as the `DEPLOY_KEY` secret in GitHub

### Deployment Process

The GitHub Action will:
1. Checkout your code
2. Install Hugo (latest version)
3. Build the site with `hugo --minify`
4. Deploy the `public/` directory to your server using rsync
5. Only deploy on pushes to main/master branch (not on pull requests)

### Testing Deployment

1. Make a small change to your site
2. Commit and push to the main branch
3. Check the **Actions** tab in your GitHub repository to see the deployment progress
4. Verify the changes are live on your website

## Browser Compatibility

The site uses modern CSS features including:
- CSS Grid and Flexbox
- CSS animations and transitions
- Backdrop filters (with fallbacks)
- Custom properties

Supported in all modern browsers (Chrome, Firefox, Safari, Edge).
