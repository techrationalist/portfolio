# Portfolio 🚀

## Introduction 👋

Welcome to my portfolio project! This is a dynamic, full-stack web application built using [Elixir](https://elixir-lang.org/) and [Phoenix](https://www.phoenixframework.org/). It showcases my projects, skills, and provides a platform for visitors to get in touch with me. The application is designed to be easily customizable and deployable, making it an ideal starting point for developers looking to create their own online portfolio. You can see it in action at [Tech Rationalist](https://techrationalist.com). Please note that this is a work in progress project, and I'm continuously improving and adding new features. 💼✨🚧

## Features 🌟

- **Project Showcase**: Display and manage your projects with ease. 📁
- **Admin Dashboard**: Secure admin interface for content management using the [`live_admin`](https://hexdocs.pm/live_admin/readme.html) package. 🔐
- **Contact Form**: Allow visitors to send you messages directly through the site. 📧
- **Markdown Support**: Write project descriptions using Markdown for rich formatting. ✍️
- **Live Updates**: Utilizes Phoenix LiveView for real-time interactions. ⚡
- **Easy Deployment**: Configured for quick deployment on Fly.io. 🚀
- **UI Components**: Built with [Tailwind CSS](https://tailwindcss.com/) (included with Phoenix) and [daisyUI](https://daisyui.com/) for a modern and clean UI. 🎨

## Requirements 📋

Ensure you have the following installed:

- **Elixir**: v1.14+ ([download](https://elixir-lang.org/install.html)) 💧
- **PostgreSQL**: ([download](https://www.postgresql.org/download/)) 🐘
- **Node.js**: v14.0+ ([download](https://nodejs.org/)) 🟩
- **Livebook**: (optional, for enhanced development experience) 📓 [@https://livebook.dev]

Phoenix (v1.7+) will be installed as a dependency when you run `mix setup`.

## Getting Started 🏁

To start your Phoenix server:

- Install Node.js dependencies with `npm install` in the `assets` directory. This is required to build Tailwind CSS and any UI libraries. 📦
- Run `mix setup` to install and setup dependencies 🛠️
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server` 🚀

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser. 🌐

## Admin Functionality 👨‍💼

This application includes an admin interface for managing content and site administration. The admin functionality allows authorized users to:

- Manage projects displayed on the portfolio 📊
- Handle contact messages received through the site 📬
- Perform other administrative tasks as needed 🔧

Admin access is restricted to authorized personnel only, ensuring the security and integrity of your portfolio content. 🔒

### Admin Setup 🛠️

This application uses a custom admin authentication system. Admin registration is not available through the web interface and should be done via the Elixir interactive shell (IEx) for security reasons. 🔐

To create an admin account:

1. Start an IEx session with your application:

   ```bash
   iex -S mix
   ```

   For Livebook users:

   a. Start Livebook by running:

      ```bash
      livebook server
      ```

   b. In a separate terminal, start an IEx session with a distributed node:

      ```bash
      iex --name your_app@127.0.0.1 --cookie your_secret_cookie -S mix
      ```

   c. In Livebook, connect to this node using the same name and cookie.

   Note: Replace "your_app@127.0.0.1" with a unique name for your application node, and "your_secret_cookie" with a secure, random string. 🍪

2. Create a new admin account:

   ```elixir
   Portfolio.Backoffice.register_admin(%{email: "admin@example.com", password: "your_secure_password"})
   ```

   Replace "<admin@example.com>" and "your_secure_password" with your desired email and password. 📧🔑

3. Admin login is available at `/admins/log_in` 🚪

4. After logging in, you can access the admin dashboard at `/admin` 🖥️

Note: Ensure you create at least one admin account to manage the site. Keep the admin credentials secure and do not share them with unauthorized individuals. 🔒

## Deployment 🚀

This project is configured for deployment on Fly.io. To deploy:

1. Install the Fly CLI: <https://fly.io/docs/hands-on/install-flyctl/> 💻
2. Run `fly launch` in the project directory. This will create a `fly.toml` file customized for your deployment. 🛫
3. Deploy your application with `fly deploy` 🚀

Note: The `fly.toml` file is gitignored as it contains deployment-specific details. 🙈

### Custom Domain Configuration 🌐

When deploying with a custom domain, ensure that the `PHX_HOST` environment variable is set correctly in your `fly.toml` file.

## Upcoming Features 🚀

I am working on exciting new features to enhance this portfolio project:

### Skills Page 🛠️

- Dedicated page to showcase technical skills and expertise
- Visual representation of skill proficiency levels

### Blog Support 📝

- Integrated blogging platform with Markdown support
- Tagging and categorization of blog posts

Stay tuned for these updates! 💡✨
