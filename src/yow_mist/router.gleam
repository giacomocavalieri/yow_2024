import gleam/string_tree
import wisp.{type Request, type Response}

pub fn handle_request(req: Request) -> Response {
  wisp.log_request(req, fn() {
    "<h1>🥭 Hello, Yow!</h1>"
    |> string_tree.from_string
    |> wisp.html_response(200)
  })
}
