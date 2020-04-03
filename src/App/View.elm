module App.View exposing (view)

import App.Model exposing (Model, Msg(..))
import Browser
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


view : Model -> Browser.Document Msg
view model =
    { title = ""
    , body =
        [ img [ src "logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        , div [] [ text (String.fromInt model.state.count) ]
        , button [ onClick Increment ] [ text "+" ]
        , div [ class "errors" ] (List.map (\err -> div [] [ text err ]) model.errors)
        ]
    }
