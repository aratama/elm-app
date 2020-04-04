module App.Model exposing (..)

import Browser
import Browser.Navigation
import Json.Decode
import Url


type alias Assets =
    { logo : String
    }


type alias State =
    { count : Int }


type alias Model =
    { key : Browser.Navigation.Key
    , state : State
    , errors : List String
    , assets : Assets
    }


type Msg
    = UrlRequest Browser.UrlRequest
    | UrlChange Url.Url
    | Restore Json.Decode.Value
    | Increment
    | Decrement
