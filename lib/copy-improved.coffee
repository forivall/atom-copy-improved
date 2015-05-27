
class CopyImproved
  prepare: ->
    @editor = atom.workspace.getActiveTextEditor()

  hasNoSelection: ->
    for selection in @editor.getSelections()
      return false unless selection.isEmpty()
    true

  doCopy: =>
    @prepare()
    return if @hasNoSelection()
    @editor.copySelectedText()

  doCut: =>
    @prepare()
    return if @hasNoSelection()
    @editor.cutSelectedText()

module.exports.activate = (state) ->
  instance = new CopyImproved()
  atom.commands.add('atom-text-editor', 'copy-improved:copy-improved', instance.doCopy)
  atom.commands.add('atom-text-editor', 'copy-improved:cut-improved', instance.doCut)

  # from copy-word atom package
  # selectWord: ->
  #   @prevPos = null
  #   cursors = @editor.getCursors()
  #   if @hasNoSelection()
  #     @prevPos = ([cursor, cursor.getBufferPosition()] for cursor in cursors)
  #     @editor.selectWord()
  #     @editor.selections = @editor.getSelectionsOrderedByBufferPosition()
  #     return true;
