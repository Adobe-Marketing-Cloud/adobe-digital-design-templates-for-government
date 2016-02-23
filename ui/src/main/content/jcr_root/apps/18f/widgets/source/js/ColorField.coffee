EighteenF = {} unless EighteenF
EighteenF.RGBColor = (color_string) ->
  @ok = false

  # strip any leading #
  # remove # if any
  color_string = color_string.substr(1, 6)  if color_string.charAt(0) is "#"
  color_string = color_string.replace(RegExp(" ", "g"), "")
  color_string = color_string.toLowerCase()

  # emd of simple type-in colors

  # array of color definition objects
  color_defs = [
    re: /^rgb\((\d{1,3}),\s*(\d{1,3}),\s*(\d{1,3})\)$/
    example: [ "rgb(123, 234, 45)", "rgb(255,234,245)" ]
    process: (bits) ->
      [ parseInt(bits[1]), parseInt(bits[2]), parseInt(bits[3]) ]
  ,
    re: /^(\w{2})(\w{2})(\w{2})$/
    example: [ "#00ff00", "336699" ]
    process: (bits) ->
      [ parseInt(bits[1], 16), parseInt(bits[2], 16), parseInt(bits[3], 16) ]
  ,
    re: /^(\w{1})(\w{1})(\w{1})$/
    example: [ "#fb0", "f0f" ]
    process: (bits) ->
      [ parseInt(bits[1] + bits[1], 16), parseInt(bits[2] + bits[2], 16), parseInt(bits[3] + bits[3], 16) ]
  ]

  # search through the definitions to find a match
  i = 0

  while i < color_defs.length
    re = color_defs[i].re
    processor = color_defs[i].process
    bits = re.exec(color_string)
    if bits
      channels = processor(bits)
      @r = channels[0]
      @g = channels[1]
      @b = channels[2]
      @ok = true
    i++

  # validate/cleanup values
  @r = (if (@r < 0 or isNaN(@r)) then 0 else ((if (@r > 255) then 255 else @r)))
  @g = (if (@g < 0 or isNaN(@g)) then 0 else ((if (@g > 255) then 255 else @g)))
  @b = (if (@b < 0 or isNaN(@b)) then 0 else ((if (@b > 255) then 255 else @b)))

  # some getters
  @toRGB = ->
    "rgb(" + @r + ", " + @g + ", " + @b + ")"

  @toHex = ->
    r = @r.toString(16)
    g = @g.toString(16)
    b = @b.toString(16)
    r = "0" + r  if r.length is 1
    g = "0" + g  if g.length is 1
    b = "0" + b  if b.length is 1
    "#" + r + g + b


  # help
  @getHelpXML = ->
    examples = new Array()

    # add regexps
    i = 0

    while i < color_defs.length
      example = color_defs[i].example
      j = 0

      while j < example.length
        examples[examples.length] = example[j]
        j++
      i++

    xml = document.createElement("ul")
    xml.setAttribute "id", "rgbcolor-examples"
    i = 0

    while i < examples.length
      try
        list_item = document.createElement("li")
        list_color = new EighteenF.RGBColor(examples[i])
        example_div = document.createElement("div")
        example_div.style.cssText = "margin: 3px; " + "border: 1px solid black; " + "background:" + list_color.toHex() + "; " + "color:" + list_color.toHex()
        example_div.appendChild document.createTextNode("test")
        list_item_value = document.createTextNode(" " + examples[i] + " -> " + list_color.toRGB() + " -> " + list_color.toHex())
        list_item.appendChild example_div
        list_item.appendChild list_item_value
        xml.appendChild list_item
      i++
    xml
CQ.form.ColorField = CQ.Ext.extend(CQ.Ext.form.TriggerField,
  colors: [ "426D9D", "759BC5", "436D9D", "1B4068", "B8C8E4", "EBD65F", "FFCE34", "996600", "FFFFFF", "F2F2F2", "CCCCCC", "333333", "049CDB", "0064CD", "52791F", "9D261D", "FFC40D", "A9620F", "C3325F", "7A43B6", "3583D0", "1A5197", "5BC0DE", "2F96B4", "98BA40", "52791F", "FFDF7A", "FFC202", "D44F2C", "771B0E", "454545", "262626" ]
  paletteCls: "x-color-palette"
  paletteStyle: ""
  constructor: (config) ->
    config = CQ.Util.applyDefaults(config,
      showHexValue: true
      allowBlank: true
      triggerClass: "x-form-color-trigger"
      defaultAutoCreate:
        tag: "input"
        type: "text"
        size: "10"
        autocomplete: "off"
        maxlength: "6"

      lengthText: CQ.I18n.getMessage("Hexadecimal color values must have either 3 or 6 characters.")
      blankText: CQ.I18n.getMessage("Must have a hexidecimal value of the format ABCDEF.")
      defaultColor: "######"
      curColor: ""
      colors: @colors
      maskRe: /[a-f0-9]/i
      regex: /[a-f0-9]/i
    )
    CQ.form.ColorField.superclass.constructor.call this, config
    @on "render", @setDefaultColor

  validateValue: (value) ->
    return true  unless @showHexValue
    if value.length < 1
      if @allowBlank
        @setBlankColor()
        return true
      else
        @el.setStyle "background-color": "#" + @defaultColor
        @markInvalid String.format(@blankText, value)
        return false
    if value.length isnt 3 and value.length isnt 6
      @markInvalid String.format(@lengthText, value)
      return false
    @setColor value
    true

  validateBlur: ->
    not @menu or not @menu.isVisible()

  getValue: ->
    @curColor or @defaultColor

  setValue: (hex) ->
    CQ.form.ColorField.superclass.setValue.call this, hex
    @setColor hex

  setColor: (hex) ->
    if hex
      @curColor = hex
      @el.setStyle
        "background-color": "#" + hex
        "background-image": "none"

      if not @showHexValue or hex is "######"
        @el.setStyle "text-indent": "-100px"
        @el.setStyle "margin-left": "100px"  if CQ.Ext.isIE
      else
        @el.setStyle "text-indent": "0px"
        @el.setStyle "margin-left": "0px"  if CQ.Ext.isIE
      bgColor = new EighteenF.RGBColor(hex)
      if bgColor.ok
        hspBrightness = @hspColorBrightness(bgColor)
        textColor = (if (hspBrightness < 130) then "#FFFFFF" else "#000000")
        @el.setStyle color: textColor

  hspColorBrightness: (color) ->
    Math.sqrt color.r * color.r * .299 + color.g * color.g * .587 + color.b * color.b * .114

  setDefaultColor: ->
    @setValue @defaultColor

  setBlankColor: ->
    @el.setStyle "background-color": "#FFFFFF"
    @setValue "######"

  menuListeners:
    select: (m, d) ->
      @setValue d

    show: -> # retain focus styling
      @onFocus()

    hide: ->
      @focus()
      ml = @menuListeners
      @menu.un "select", ml.select, this
      @menu.un "show", ml.show, this
      @menu.un "hide", ml.hide, this

  handleSelect: (palette, selColor) ->
    @setValue selColor

  onTriggerClick: ->
    return  if @disabled
    unless @menu?
      menuConfig =
        colors: @colors
        itemCls: @paletteCls
        style: @paletteStyle

      @menu = new CQ.Ext.menu.ColorMenu(menuConfig)
      @menu.palette.on "select", @handleSelect, this
    @menu.on CQ.Ext.apply({}, @menuListeners,
      scope: this
    )
    @menu.show @el, "tl-bl?"
)
CQ.Ext.reg "bacolorfield", CQ.form.ColorField