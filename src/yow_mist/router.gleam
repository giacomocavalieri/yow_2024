import gleam/list
import gleam/string_tree
import lustre/attribute.{href}
import lustre/element.{type Element}
import lustre/element/html.{a, li, text, ul}
import pog.{type Connection, Date}
import wisp.{type Request, type Response}

pub fn handle_request(db: Connection, req: Request) -> Response {
  use <- wisp.log_request(req)
  use <- wisp.rescue_crashes

  view_accounts(todo as "how do I load the accounts")
  |> element.to_string
  |> string_tree.from_string
  |> wisp.html_response(200)
}

fn view_accounts(accounts) {
  let items = accounts |> list.map(view_account_line)
  ul([], items)
}

fn view_account_line(account) {
  todo as "render the account line!"
  //li([], [
  //  text(account.display_nam <> " - "),
  //  a([href(account.link)], [text("@" <> account.handle)]),
  //])
}
