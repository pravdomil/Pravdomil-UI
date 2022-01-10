module Element.PravdomilUI.Theme exposing (..)

import Element


type alias Theme msg =
    { page : List (Element.Attribute msg)
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
