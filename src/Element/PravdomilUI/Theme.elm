module Element.PravdomilUI.Theme exposing (..)

import Element
import Element.Font


type alias Theme msg a =
    { a
        | page : List (Element.Attribute msg)
        , paragraph : List (Element.Attribute msg)
        , textColumn : List (Element.Attribute msg)
        , link : List (Element.Attribute msg)
        , heading1 : List (Element.Attribute msg)
        , heading2 : List (Element.Attribute msg)
        , heading3 : List (Element.Attribute msg)
        , heading4 : List (Element.Attribute msg)
        , heading5 : List (Element.Attribute msg)
        , heading6 : List (Element.Attribute msg)
        , horizontalLine : List (Element.Attribute msg)
        , horizontalLineContainer : List (Element.Attribute msg)
        , label : List (Element.Attribute msg)
        , button : List (Element.Attribute msg)
        , input : List (Element.Attribute msg)
        , inputPlaceholder : List (Element.Attribute msg)
        , blockQuote : List (Element.Attribute msg)
        , codeSpan : List (Element.Attribute msg)
        , codeBlock : List (Element.Attribute msg)
    }


type alias Style a =
    { a
        | black0 : Element.Color
        , black10 : Element.Color
        , black20 : Element.Color
        , black30 : Element.Color
        , black40 : Element.Color
        , black50 : Element.Color
        , black60 : Element.Color
        , black70 : Element.Color
        , black80 : Element.Color
        , black90 : Element.Color
        , black100 : Element.Color

        --
        , primary : Element.Color
        , secondary : Element.Color

        --
        , danger : Element.Color
        , info : Element.Color
        , success : Element.Color
        , warning : Element.Color

        --
        , fontFamily : List Element.Font.Font
        , monospaceFontFamily : List Element.Font.Font

        --
        , shadow :
            Float
            ->
                { offset : ( Float, Float )
                , size : Float
                , blur : Float
                , color : Element.Color
                }
    }
