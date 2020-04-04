module App.View exposing (view)

import App.Model exposing (Model, Msg(..))
import Browser
import Html exposing (button, div, h1, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


view : Model -> Browser.Document Msg
view model =
    { title = ""
    , body =
        [ img [ src "logo.svg" ] []
        , div [] [ text (String.fromInt model.state.count) ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Decrement ] [ text "-" ]
        , div [ class "errors" ] (List.map (\err -> div [] [ text err ]) model.errors)
        ]
    }
