columnBorderPresets = (dialog) ->
  columnConfigSelect = CQ.Ext.getCmp("columnConfiguration").getValue()
  CQ.Ext.getCmp(columnConfigSelect).toggle true  unless typeof CQ.Ext.getCmp(columnConfigSelect) is "undefined"
  CQ.Ext.getCmp("isBorderTopButton").toggle true  if CQ.Ext.getCmp("isBorderTop").getValue() is "true"
  CQ.Ext.getCmp("isBorderBottomButton").toggle true  if CQ.Ext.getCmp("isBorderBottom").getValue() is "true"
  CQ.Ext.getCmp("isBorderInsideButton").toggle true  if CQ.Ext.getCmp("isBorderInside").getValue() is "true"