module WeatherApp where

import Html exposing (..)
import WeatherSlot

-- Model

type alias Model = WeatherSlot.Model

init : Model
init = WeatherSlot.init

-- Update

type Action = Nothing

update : Action -> Model -> Model
update a m = m

-- View

view : Signal.Address Action -> Model -> Html
view address model =
  div [] 
    [ text "The weather somewhere is"
    , WeatherSlot.view model
    ]
