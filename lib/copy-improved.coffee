module.exports =

  activate: (state) ->
    atom.workspaceView.command "copy-improved:copy-improved", => @doCopy()
    atom.workspaceView.command "copy-improved:cut-improved", => @doCut()

  # from copy-word atom package
  # selectWord: ->
  #   @prevPos = null
  #   cursors = @editor.getCursors()
  #   if @hasNoSelection()
  #     @prevPos = ([cursor, cursor.getBufferPosition()] for cursor in cursors)
  #     @editor.selectWord()
  #     @editor.selections = @editor.getSelectionsOrderedByBufferPosition()
  #     return true;

  prepare: ->
    @editor = atom.workspace.getActiveTextEditor()

  hasNoSelection: ->
    for selection in @editor.getSelections()
      return false unless selection.isEmpty()
    true

  doCopy: ->
    @prepare()
    return if @hasNoSelection()
    @editor.copySelectedText()

  doCut: ->
    @prepare()
    return if @hasNoSelection()
    @editor.cutSelectedText()
