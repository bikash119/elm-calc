module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onBlur, onClick, onInput)



--MODEL


initialModel =
    { inputName = "me"
    , outputName = "me"
    }



--UPDATE


update msg model =
    if msg.desc == "greet" then
        { model | inputName = msg.data }

    else if msg.desc == "greetOnClick" then
        { model | outputName = msg.data }

    else
        model



--VIEW


view model =
    div []
        [ label [] [ text "enter your name" ]
        , input [ placeholder "name ", value model.inputName, onInput (\str -> { desc = "greet", data = str }) ] []
        , button [ onClick { desc = "greetOnClick", data = model.inputName } ] [ text "greet" ]
        , div []
            [ text ("hello " ++ model.outputName)
            ]
        ]


main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
