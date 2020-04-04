module Main exposing (main)

import App.Model exposing (Assets, Model, Msg(..), State)
import App.Port
import App.Update
import App.View
import Browser
import Browser.Navigation
import Json.Decode
import Json.Encode
import Url


init : { state : State, assets : Assets } -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init { state, assets } _ key =
    ( { key = key
      , state = state
      , errors = []
      , assets = assets
      }
    , Cmd.none
    )


encode : State -> Json.Decode.Value
encode state =
    Json.Encode.object [ ( "count", Json.Encode.int state.count ) ]


main : Program { state : State, assets : Assets } Model Msg
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
