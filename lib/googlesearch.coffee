Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'yandexsearch:yandex-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://yandex.com/search/?text=#{cased}"
        Shell.openExternal url
