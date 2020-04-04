module Main exposing (main)

import App.Model exposing (Model, Msg(..), State)
import App.Port
import App.Update
import App.View
import Browser
import Browser.Navigation
import Json.Decode
import Json.Encode
import Url


init : State -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flag _ key =
    ( { key = key
      , state = flag
      , errors = []
      }
    , Cmd.none
    )


encode : State -> Json.Decode.Value
encode state =
    Json.Encode.object [ ( "count", Json.Encode.int state.count ) ]


main : Program State Model Msg
main =
    Browser.application
        { view = App.View.view
        , init = init
        , update =
            \msg model ->
                case App.Update.update msg model of
                    ( model_, cmd ) ->
                        ( model_, Cmd.batch [ cmd, App.Port.save (encode model_.state) ] )
        , subscriptions = \_ -> App.Port.restore Restore
        , onUrlRequest = UrlRequest
        , onUrlChange = UrlChange
        }
