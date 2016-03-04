import WeatherApp exposing (init, update, view) 
import StartApp.Simple exposing (start)
import Html

main : Signal Html.Html
main =
  start 
    { model = init
    , update = update
    , view = view
    }
