module App.View exposing (view)

import App.Model exposing (Model, Msg(..))
import Browser
import Html exposing (button, div, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


view : Model -> Browser.Document Msg
view model =
    { title = ""
    , body =
        [ img [ src model.assets.logo ] []
        , div [] [ text (String.fromInt model.state.count) ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Decrement ] [ text "-" ]
        , div [ class "errors" ] (List.map (\err -> div [] [ text err ]) model.errors)
        ]
    }
