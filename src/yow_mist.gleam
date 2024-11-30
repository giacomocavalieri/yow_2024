import gleam/erlang/process
import mist
import pog
import wisp
import wisp/wisp_mist
import yow_mist/router

pub fn main() {
  wisp.configure_logger()

  let db =
    pog.default_config()
    |> pog.database("yow")
    |> pog.user("giacomocavalieri")
    |> pog.connect

  let secret_key_base = wisp.random_string(64)
  let assert Ok(_) =
    wisp_mist.handler(router.handle_request(db, _), secret_key_base)
    |> mist.new
    |> mist.port(8000)
    |> mist.start_http

  process.sleep_forever()
}
