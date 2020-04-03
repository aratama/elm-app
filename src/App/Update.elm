module App.Update exposing (update)

import App.Model exposing (Model, Msg(..), State)
import Browser
import Browser.Navigation
import Json.Decode
import Json.Encode
import Url


decoder : Json.Decode.Decoder State
decoder =
    Json.Decode.map (\count -> { count = count })
        (Json.Decode.field "count" Json.Decode.int)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequest urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )

                Browser.External url ->
                    ( model, Browser.Navigation.load url )

        UrlChange url ->
            ( model, Cmd.none )

        Increment ->
            let
                state =
                    model.state
            in
            ( { model | state = { state | count = state.count + 1 } }, Cmd.none )

        Restore json ->
            case Json.Decode.decodeValue decoder json of
                Err err ->
                    ( { model | errors = Json.Decode.errorToString err :: model.errors }, Cmd.none )

                Ok decoded ->
                    ( { model | state = decoded }, Cmd.none )
