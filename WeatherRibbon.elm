module WeatherRibbon where

import WeatherSlot exposing (Model)
import Html exposing (..)
import Maybe exposing (withDefault)

-- MODEL

type alias Slots = List WeatherSlot.Model

type alias NonEmptyRibbon = ( Slots, WeatherSlot.Model, Slots )  -- at least one slot

type alias Model = NonEmptyRibbon

create : Slots -> Maybe Model
create slots =
  case slots of
    [] -> Nothing

    head :: tail -> Just ( [], head, tail )

init : Model
init =
  ( []
  , { temperature = 23.0, pressure = 1010, description = "coldish" }
  , [ { temperature = 25.0, pressure = 1013, description = "warmer" }
    , { temperature = 24.0, pressure = 1015, description = "colder again" }
    ]
  )

-- UPDATE

type Action 
  = Next
  | Previous

update : Action -> Model -> Model
update action model = 
  case ( action, model ) of
    (Next, (_, _, [])) -> 
      model

    (Previous, ([], _, _)) -> 
      model
      
    (Next, (before, slot, afterHead :: afterRest)) ->
      (slot :: before, afterHead, afterRest)

    (Previous, (beforeHead :: beforeRest, slot, after)) ->
      (beforeRest, beforeHead, slot :: after)

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model = 
  div [] 
    [ viewSlots model 
    ]

viewSlots : Model -> Html
viewSlots (before, slot, rest) =
  span []
    [ text "..."
    , WeatherSlot.view slot
    , text "..."
    ]
   
