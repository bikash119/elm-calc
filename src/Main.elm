module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



--MODEL


initialModel =
    { name = "me"
    }



--UPDATE

update msg model =
       if msg.desc == "greet" then
            { model | name = msg.data }
        else
            model
--VIEW


view model =
    div []
        [ label [] [ text "enter your name" ]
        , input [ placeholder "name ", value model.name ] []
        , button [ onClick {desc = "greet", data = "model.name"} ] [ text "greet" ]
        , div [] 
                [
                    text ( "hello " ++ model.name) 
                ]
               
        ]


main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
