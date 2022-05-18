module Element.PravdomilUI exposing (..)

import Element
import Element.Background
import Element.Border
import Element.Events
import Element.Font
import Element.Input
import Element.Keyed
import Element.Lazy
import Element.PravdomilUI.Theme
import Element.Region
import Html
import Html.Attributes


layout : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> Element msg -> Html.Html msg
layout theme a =
    Element.layoutWith { options = theme.options } (theme.page ++ a)


layoutWith : Element.PravdomilUI.Theme.Theme msg a -> { options : List Option } -> List (Attribute msg) -> Element msg -> Html.Html msg
layoutWith theme opt a =
    Element.layoutWith { opt | options = theme.options ++ opt.options } (theme.page ++ a)


paragraph : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
paragraph theme a =
    Element.paragraph (theme.paragraph ++ a)


{-| <https://github.com/mdgriffith/elm-ui/issues/286>
-}
textColumn : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
textColumn theme a =
    Element.textColumn (width fill :: theme.textColumn ++ a)


link : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element msg, url : String } -> Element msg
link theme a =
    Element.link (theme.link ++ a)


linkWithOnPress : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element msg, onPress : Maybe msg } -> Element msg
linkWithOnPress theme a =
    Element.Input.button (theme.link ++ a)


newTabLink : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element msg, url : String } -> Element msg
newTabLink theme a =
    Element.newTabLink (theme.link ++ a)


download : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element msg, url : String } -> Element msg
download theme a =
    Element.download (theme.link ++ a)


downloadAs : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element msg, filename : String, url : String } -> Element msg
downloadAs theme a =
    Element.downloadAs (theme.link ++ a)


heading1 : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
heading1 theme a =
    paragraph theme (regionHeading 1 :: theme.heading1 ++ a)


heading2 : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
heading2 theme a =
    paragraph theme (regionHeading 2 :: theme.heading2 ++ a)


heading3 : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
heading3 theme a =
    paragraph theme (regionHeading 3 :: theme.heading3 ++ a)


heading4 : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
heading4 theme a =
    paragraph theme (regionHeading 4 :: theme.heading4 ++ a)


heading5 : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
heading5 theme a =
    paragraph theme (regionHeading 5 :: theme.heading5 ++ a)


heading6 : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
heading6 theme a =
    paragraph theme (regionHeading 6 :: theme.heading6 ++ a)


horizontalLine : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> Element msg
horizontalLine theme a =
    el (width fill :: theme.horizontalLineContainer)
        (el (width fill :: theme.horizontalLine ++ a) none)


labelLeft : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> Element msg -> Element.Input.Label msg
labelLeft theme a =
    Element.Input.labelLeft (theme.label ++ a)


labelRight : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> Element msg -> Element.Input.Label msg
labelRight theme a =
    Element.Input.labelRight (theme.label ++ a)


labelAbove : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> Element msg -> Element.Input.Label msg
labelAbove theme a =
    Element.Input.labelAbove (theme.label ++ a)


labelBelow : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> Element msg -> Element.Input.Label msg
labelBelow theme a =
    Element.Input.labelBelow (theme.label ++ a)


labelHidden : String -> Element.Input.Label msg
labelHidden a =
    Element.Input.labelHidden a


button : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element msg, onPress : Maybe msg } -> Element msg
button theme a =
    Element.Input.button (theme.button ++ a)


inputText : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element.Input.Label msg, placeholder : Maybe (Element.Input.Placeholder msg), text : String, onChange : String -> msg } -> Element msg
inputText theme a =
    Element.Input.text (theme.input ++ a)


inputMultiline : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element.Input.Label msg, placeholder : Maybe (Element.Input.Placeholder msg), text : String, spellcheck : Bool, onChange : String -> msg } -> Element msg
inputMultiline theme a =
    Element.Input.multiline (theme.input ++ a)


inputSearch : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element.Input.Label msg, placeholder : Maybe (Element.Input.Placeholder msg), text : String, onChange : String -> msg } -> Element msg
inputSearch theme a =
    Element.Input.search (theme.input ++ a)


inputEmail : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element.Input.Label msg, placeholder : Maybe (Element.Input.Placeholder msg), text : String, onChange : String -> msg } -> Element msg
inputEmail theme a =
    Element.Input.email (theme.input ++ a)


inputNewPassword : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element.Input.Label msg, placeholder : Maybe (Element.Input.Placeholder msg), text : String, show : Bool, onChange : String -> msg } -> Element msg
inputNewPassword theme a =
    Element.Input.newPassword (theme.input ++ a)


inputCurrentPassword : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> { label : Element.Input.Label msg, placeholder : Maybe (Element.Input.Placeholder msg), text : String, show : Bool, onChange : String -> msg } -> Element msg
inputCurrentPassword theme a =
    Element.Input.currentPassword (theme.input ++ a)


inputPlaceholder : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> Element msg -> Element.Input.Placeholder msg
inputPlaceholder theme a =
    Element.Input.placeholder (theme.inputPlaceholder ++ a)


blockQuote : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
blockQuote theme a =
    column (theme.blockQuote ++ a)


codeSpan : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> Element msg -> Element msg
codeSpan theme a =
    el (theme.codeSpan ++ a)


codeBlock : Element.PravdomilUI.Theme.Theme msg a -> List (Attribute msg) -> List (Element msg) -> Element msg
codeBlock theme a =
    column (theme.codeBlock ++ a)


{-| <https://github.com/mdgriffith/elm-ui/issues/276>
-}
lineBreak : Element msg
lineBreak =
    html (Html.br [] [])


{-| <https://github.com/mdgriffith/elm-ui/issues/319>
-}
id : String -> Attribute msg
id a =
    htmlAttribute (Html.Attributes.id a)


noneAttribute : Attribute msg
noneAttribute =
    htmlAttribute (Html.Attributes.classList [])



--


type alias Attr decorative msg =
    Element.Attr decorative msg


type alias Attribute msg =
    Element.Attribute msg


type alias Color =
    Element.Color


type alias Column record msg =
    Element.Column record msg


type alias Decoration =
    Element.Decoration


type alias Device =
    Element.Device


type alias Element msg =
    Element.Element msg


type alias FocusStyle =
    Element.FocusStyle


type alias IndexedColumn record msg =
    Element.IndexedColumn record msg


type alias Length =
    Element.Length


type alias Option =
    Element.Option


above =
    Element.above


alignBottom =
    Element.alignBottom


alignLeft =
    Element.alignLeft


alignRight =
    Element.alignRight


alignTop =
    Element.alignTop


alpha =
    Element.alpha


behindContent =
    Element.behindContent


below =
    Element.below


centerX =
    Element.centerX


centerY =
    Element.centerY


classifyDevice =
    Element.classifyDevice


clip =
    Element.clip


clipX =
    Element.clipX


clipY =
    Element.clipY


column =
    Element.column


el =
    Element.el


explain =
    Element.explain


fill =
    Element.fill


fillPortion =
    Element.fillPortion


focusStyle =
    Element.focusStyle


focused =
    Element.focused


forceHover =
    Element.forceHover


fromRgb =
    Element.fromRgb


fromRgb255 =
    Element.fromRgb255


height =
    Element.height


html =
    Element.html


htmlAttribute =
    Element.htmlAttribute


image =
    Element.image


inFront =
    Element.inFront


indexedTable =
    Element.indexedTable


map =
    Element.map


mapAttribute =
    Element.mapAttribute


maximum =
    Element.maximum


minimum =
    Element.minimum


modular =
    Element.modular


mouseDown =
    Element.mouseDown


mouseOver =
    Element.mouseOver


moveDown =
    Element.moveDown


moveLeft =
    Element.moveLeft


moveRight =
    Element.moveRight


moveUp =
    Element.moveUp


noHover =
    Element.noHover


noStaticStyleSheet =
    Element.noStaticStyleSheet


none =
    Element.none


onLeft =
    Element.onLeft


onRight =
    Element.onRight


padding =
    Element.padding


paddingEach minX maxX minY maxY =
    Element.paddingEach { left = minX, right = maxX, top = minY, bottom = maxY }


paddingXY =
    Element.paddingXY


pointer =
    Element.pointer


px =
    Element.px


rgb =
    Element.rgb


rgb255 =
    Element.rgb255


rgba =
    Element.rgba


rgba255 =
    Element.rgba255


rotate =
    Element.rotate


row =
    Element.row


scale =
    Element.scale


scrollbarX =
    Element.scrollbarX


scrollbarY =
    Element.scrollbarY


scrollbars =
    Element.scrollbars


shrink =
    Element.shrink


spaceEvenly =
    Element.spaceEvenly


spacing =
    Element.spacing


spacingXY =
    Element.spacingXY


table =
    Element.table


text =
    Element.text


toRgb =
    Element.toRgb


transparent =
    Element.transparent


width =
    Element.width


wrappedRow =
    Element.wrappedRow



--


bgColor =
    Element.Background.color


bgGradient =
    Element.Background.gradient


bgImage =
    Element.Background.image


bgTiled =
    Element.Background.tiled


bgTiledX =
    Element.Background.tiledX


bgTiledY =
    Element.Background.tiledY


bgUncropped =
    Element.Background.uncropped



--


borderColor =
    Element.Border.color


borderDashed =
    Element.Border.dashed


borderDotted =
    Element.Border.dotted


borderGlow =
    Element.Border.glow


borderInnerGlow =
    Element.Border.innerGlow


borderInnerShadow =
    Element.Border.innerShadow


borderRoundEach topLeft topRight bottomLeft bottomRight =
    Element.Border.roundEach { topLeft = topLeft, topRight = topRight, bottomLeft = bottomLeft, bottomRight = bottomRight }


borderRounded =
    Element.Border.rounded


borderShadow =
    Element.Border.shadow


borderSolid =
    Element.Border.solid


borderWidth =
    Element.Border.width


borderWidthEach minX maxX minY maxY =
    Element.Border.widthEach { left = minX, right = maxX, top = minY, bottom = maxY }


borderWidthXY =
    Element.Border.widthXY



--


onClick =
    Element.Events.onClick


onDoubleClick =
    Element.Events.onDoubleClick


onFocus =
    Element.Events.onFocus


onLoseFocus =
    Element.Events.onLoseFocus


onMouseDown =
    Element.Events.onMouseDown


onMouseEnter =
    Element.Events.onMouseEnter


onMouseLeave =
    Element.Events.onMouseLeave


onMouseMove =
    Element.Events.onMouseMove


onMouseUp =
    Element.Events.onMouseUp



--


type alias Font =
    Element.Font.Font


type alias Variant =
    Element.Font.Variant


fontAlignLeft =
    Element.Font.alignLeft


fontAlignRight =
    Element.Font.alignRight


fontBold =
    Element.Font.bold


fontCenter =
    Element.Font.center


fontColor =
    Element.Font.color


fontDiagonalFractions =
    Element.Font.diagonalFractions


fontExternal =
    Element.Font.external


fontExtraBold =
    Element.Font.extraBold


fontExtraLight =
    Element.Font.extraLight


fontFamily =
    Element.Font.family


fontFeature =
    Element.Font.feature


fontGlow =
    Element.Font.glow


fontHairline =
    Element.Font.hairline


fontHeavy =
    Element.Font.heavy


fontIndexed =
    Element.Font.indexed


fontItalic =
    Element.Font.italic


fontJustify =
    Element.Font.justify


fontLetterSpacing =
    Element.Font.letterSpacing


fontLigatures =
    Element.Font.ligatures


fontLight =
    Element.Font.light


fontMedium =
    Element.Font.medium


fontMonospace =
    Element.Font.monospace


fontOrdinal =
    Element.Font.ordinal


fontRegular =
    Element.Font.regular


fontSansSerif =
    Element.Font.sansSerif


fontSemiBold =
    Element.Font.semiBold


fontSerif =
    Element.Font.serif


fontShadow =
    Element.Font.shadow


fontSize =
    Element.Font.size


fontSlashedZero =
    Element.Font.slashedZero


fontSmallCaps =
    Element.Font.smallCaps


fontStackedFractions =
    Element.Font.stackedFractions


fontStrike =
    Element.Font.strike


fontSwash =
    Element.Font.swash


fontTabularNumbers =
    Element.Font.tabularNumbers


fontTypeface =
    Element.Font.typeface


fontUnderline =
    Element.Font.underline


fontUnitalicized =
    Element.Font.unitalicized


fontVariant =
    Element.Font.variant


fontVariantList =
    Element.Font.variantList


fontWordSpacing =
    Element.Font.wordSpacing



--


inputCheckbox =
    Element.Input.checkbox


inputDefaultCheckbox =
    Element.Input.defaultCheckbox


inputDefaultThumb =
    Element.Input.defaultThumb


inputFocusedOnLoad =
    Element.Input.focusedOnLoad


inputOption =
    Element.Input.option


inputOptionWith =
    Element.Input.optionWith


inputRadio =
    Element.Input.radio


inputRadioRow =
    Element.Input.radioRow


inputSlider =
    Element.Input.slider


inputSpellChecked =
    Element.Input.spellChecked


inputThumb =
    Element.Input.thumb


inputUsername =
    Element.Input.username



--


keyedColumn =
    Element.Keyed.column


keyedEl =
    Element.Keyed.el


keyedRow =
    Element.Keyed.row



--


lazy =
    Element.Lazy.lazy


lazy2 =
    Element.Lazy.lazy2


lazy3 =
    Element.Lazy.lazy3


lazy4 =
    Element.Lazy.lazy4


lazy5 =
    Element.Lazy.lazy5



--


regionAnnounce =
    Element.Region.announce


regionAnnounceUrgently =
    Element.Region.announceUrgently


regionAside =
    Element.Region.aside


regionDescription =
    Element.Region.description


regionFooter =
    Element.Region.footer


regionHeading =
    Element.Region.heading


regionMainContent =
    Element.Region.mainContent


regionNavigation =
    Element.Region.navigation
