module JS.DOM.Raw.Clipboard

import JS.DOM.Raw.Types

--------------------------------------------------------------------------------
--          Casts
--------------------------------------------------------------------------------

export
Cast Clipboard EventTarget where
  cast = believe_me

export
Cast ClipboardEvent Event where
  cast = believe_me

export
Cast ClipboardEventInit EventInit where
  cast = believe_me

export
Cast ClipboardPermissionDescriptor PermissionDescriptor where
  cast = believe_me