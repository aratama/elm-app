module App.Model exposing (..)

import Browser
import Browser.Navigation
import Json.Decode
import Url


type alias State =
    { count : Int }


type alias Model =
    { key : Browser.Navigation.Key
    , state : State
    , errors : List String
    }


type Msg
    = UrlRequest Browser.UrlRequest
    | UrlChange Url.Url
    | Increment
    | Restore Json.Decode.Value
