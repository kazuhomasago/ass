(($, _global, _doc) ->
  $(_doc).ready( ->
    commonInitialize()
    return
  )

  commonInitialize = ->
    # 全角英数 → 半角英数 に変換
    $('.fullToHalf').blur ->
      txt = $(@).val()
      han = txt.replace(/[Ａ-Ｚａ-ｚ０-９]/g, (s) ->
        String.fromCharCode s.charCodeAt(0) - 0xFEE0
      )
      $(@).val(han)
      return

    # Enterで一番上の隠しメインsubmitを反応させる
    $(document).on 'keypress', '.mainSubmitButton', (event) ->
      event.preventDefault()

      if event.which == 13
        $('#mainSubmit').click()
      return

    return

  _global.commonInitialize = commonInitialize
  return
)(jQuery, window, document)
