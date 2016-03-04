module WeatherSlot where

import Html exposing (..)

type alias Model = 
  { temperature : Float
  , pressure : Float
  , description : String
  }

init : Model
init = 
  { temperature = 25.0
  , pressure = 1013
  , description = "fine weather"
  }

view : Model -> Html
view model =
  div [] 
  [ p [] [ text "Temperature: " 
         , model.temperature |> toString |> text
         , text "°C" ]
  , p [] [ text "Atmospheric pressure: "
         , model.pressure |> toString |> text
         , text "hPa"
         ]
  , p [] [ text "Description: "
         , model.description |> text
         ]
  ]
