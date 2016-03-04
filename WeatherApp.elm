module WeatherApp where

import Html exposing (..)

-- Model

type alias Model = Int  

-- Update

type Action = Nothing

update : Action -> Model -> Model
update a m = m

-- View

view : Signal.Address Action -> Model -> Html
view address model =
  div [] 
    [ text "The weather's fine!"
    ]
