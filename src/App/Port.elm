port module App.Port exposing (restore, save)

import Json.Decode


port save : Json.Decode.Value -> Cmd msg


port restore : (Json.Decode.Value -> msg) -> Sub msg
