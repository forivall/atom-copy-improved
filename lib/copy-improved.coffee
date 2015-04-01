module.exports =

  activate: (state) ->
    atom.workspaceView.command "copy-improved:copy-improved", => @doCopy()
    atom.workspaceView.command "copy-improved:cut-improved", => @doCut()

  # from copy-word atom package
  # selectWord: ->
  #   @prevPos = null
  #   @editor = atom.workspace.getActiveEditor()
  #   cursors = @editor.getCursors()
  #   if @hasNoSelection()
  #     @prevPos = ([cursor, cursor.getBufferPosition()] for cursor in cursors)
  #     @editor.selectWord()
  #     @editor.selections = @editor.getSelectionsOrderedByBufferPosition()
  #     return true;

  hasNoSelection: ->
    for selection in @editor.getSelections()
      return false unless selection.isEmpty()
    true

  doCopy: ->
    return if @hasNoSelection()
    @editor.copySelectedText()

  doCut: ->
    return if @hasNoSelection()
    @editor.cutSelectedText()
