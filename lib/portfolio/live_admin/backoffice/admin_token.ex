defmodule Portfolio.LiveAdmin.Backoffice.AdminToken do
  use LiveAdmin.Resource,
    schema: Portfolio.Backoffice.AdminToken,
    # Jason.EncodeError when trying to render the token field.
    # That's why we are hiding it from the admin interface.
    hidden_fields: [:token]
end
