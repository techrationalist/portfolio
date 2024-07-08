# Portfolio

To start your Phoenix server:

* Install Node.js dependencies with `npm install` in the `assets` directory. This is required to build Tailwind CSS and any UI libraries.
* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

* Official website: <https://www.phoenixframework.org/>
* Guides: <https://hexdocs.pm/phoenix/overview.html>
* Docs: <https://hexdocs.pm/phoenix>
* Forum: <https://elixirforum.com/c/phoenix-forum>
* Source: <https://github.com/phoenixframework/phoenix>

## Deployment

This project is configured for deployment on Fly.io. To deploy:

1. Install the Fly CLI: <https://fly.io/docs/hands-on/install-flyctl/>
2. Run `fly launch` in the project directory. This will create a `fly.toml` file customized for your deployment.
3. Deploy your application with `fly deploy`

Note: The `fly.toml` file is gitignored as it contains deployment-specific details.

### Custom Domain Configuration

When deploying with a custom domain, ensure that the `PHX_HOST` environment variable is set correctly in your `fly.toml` file:

```toml
[env]
        PHX_HOST = "your-custom-domain.com"
        PORT = "8080"
```

This setting is crucial for proper functioning of LiveView and WebSocket connections on your custom domain.
