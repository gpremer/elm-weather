module WeatherApp where

import Html exposing (..)
import WeatherRibbon

-- Model

type alias Model = WeatherRibbon.Model

init : Model
init = WeatherRibbon.init

-- Update

type alias Action = WeatherRibbon.Action

update : Action -> Model -> Model
update a m = m

-- View

view : Signal.Address Action -> Model -> Html
view address model =
  div [] 
    [ text "The weather somewhere is"
    , WeatherRibbon.view address model
    ]
