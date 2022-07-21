module Element.PravdomilUi.Theme exposing (..)

import Element
import Element.Font
import Element.Input


type alias Theme msg a =
    { a
        | options : List Element.Option
        , page : List (Element.Attribute msg)
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
        , inputOption : Element.Input.OptionState -> List (Element.Attribute msg)
        , blockQuote : List (Element.Attribute msg)
        , codeSpan : List (Element.Attribute msg)
        , codeBlock : List (Element.Attribute msg)
    }


type alias Style a =
    { a
        | fore100 : Element.Color
        , fore90 : Element.Color
        , fore80 : Element.Color
        , fore70 : Element.Color
        , fore60 : Element.Color
        , fore50 : Element.Color

        --
        , back100 : Element.Color
        , back90 : Element.Color
        , back80 : Element.Color
        , back70 : Element.Color
        , back60 : Element.Color
        , back50 : Element.Color

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
        , backdrop : Element.Color
        , shadow :
            Float
            ->
                { offset : ( Float, Float )
                , size : Float
                , blur : Float
                , color : Element.Color
                }
    }
