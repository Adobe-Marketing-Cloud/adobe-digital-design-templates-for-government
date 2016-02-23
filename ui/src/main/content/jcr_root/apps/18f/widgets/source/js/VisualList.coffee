EighteenF = {}  unless EighteenF
EighteenF.VisualList = CQ.Ext.extend(CQ.Ext.Panel,
  dataView: null
  store: null
  selectedValueHiddenField: null
  name: null
  constructor: (config) ->
    EighteenF.VisualList.superclass.constructor.call this, config
    visualList = this

    # This is the property label we use to store / fetch the value
    visualList.name = config["name"]

    # Use the datalocation component config to fetch the resources to display
    visualList.store = new CQ.Ext.data.JsonStore(
      url: CQ.HTTP.externalize(config["datalocation"])
      root: "images"
      fields: [ "name", "imagepath", "value" ]
    )
    visualList.store.load

# Store loads async, so we need to utilize a callback to actually preselect the default value
      callback: (records, options, success) ->
        visualList = this
        parentDialog = visualList.findParentByType("dialog")

        #Call loadContent only if path available.  Allows Page Properties dialog to load, but without a selected header.
        #This only works because this component doesn't force a selection.  Upon save, the value of headerlayoutsel property in the
        #repository is not changed if nothing is selected.
        if parentDialog.path
          visualList.loadContent parentDialog.path, visualList
        else
          console.log "MISSING VALUE in VisualList: parentDialog.path"  if console

      scope: this

    tpl = new CQ.Ext.XTemplate("<tpl for=\".\">", "<div class=\"thumb-wrap{[xindex == xcount ? \" ba-last\" : \"\"]}\" id=\"{name}\">", "<div class=\"thumb\"><img src=\"{imagepath}\" title=\"{name}\"></div>", "<span class=\"ba-label x-editable\">{name}</span>", "<br clear=\"all\"/>", "</div>", "</tpl>", "<div class=\"x-clear\"></div>")
    visualList.title = (if config["title"] and config["title"].length > 0 then config["title"] else "Visual List")
    visualList.dataView = new CQ.Ext.DataView(
      store: visualList.store
      tpl: tpl
      autoHeight: true
      multiSelect: true
      overClass: "x-view-over"
      itemSelector: "div.thumb-wrap"
      emptyText: "No images to display"
    )
    panel = new CQ.Ext.Panel(
      id: "EighteenF-visual-list-view"
      cls: "EighteenF-visual-list-view"
      frame: true
      autoHeight: true
      autoWidth: true
      layout: "fit"
      collapsible: true
      items: @dataView
    )
    visualList.add panel

    #Hidden field to use for saving the value to the repo
    visualList.selectedValueHiddenField = new CQ.Ext.form.Hidden(name: visualList.name)
    visualList.add visualList.selectedValueHiddenField

  initComponent: ->
    EighteenF.VisualList.superclass.initComponent.call this

  loadContent: (path, context) ->
    pathelements = path.split("/")
    nameelements = context.name.split("/")

    #Remove the ./
    nameelements.shift()
    while nameelements[0] is ".."
      pathelements.pop()
      nameelements.shift()
    targetpatharray = pathelements.concat(nameelements)
    targetpath = targetpatharray.join("/") + CQ.HTTP.EXTENSION_JSON
    content = CQ.HTTP.eval(targetpath)
    if content
      fieldname = targetpatharray.pop()
      if fieldname
        if content[fieldname]
          records = context.store.getRange()
          i = 0

          while records and i < records.length
            record = records[i]
            if record and record.get("value") is content[fieldname]
              context.dataView.select i
              break
            i++

  onRender: (e) ->
    EighteenF.VisualList.superclass.onRender.call this, e
    parentDialog = @findParentByType("dialog")
    visualList = this
    if parentDialog
      parentDialog.on "beforesubmit", (->
        visualList.selectedValueHiddenField.setRawValue visualList.dataView.getSelectedRecords()[0].data.value  if visualList.dataView.getSelectedRecords()[0] and visualList.dataView.getSelectedRecords()[0].data
      ), this
)
CQ.Ext.reg "visuallist", EighteenF.VisualList