module Web.Fetch
 
import JS
import Web.Internal.FetchPrim
import Web.Internal.Types

--------------------------------------------------------------------------------
--          Interfaces
--------------------------------------------------------------------------------

namespace Headers
  
  public export
  JSType Headers where
    parents =  [ Object ]

    mixins =  []
  
  export
  new :  (init : Optional (NS I [ Array (Array ByteString)
                                , Record ByteString ByteString
                                ]))
      -> JSIO Headers
  new a = primJS $ Headers.prim__new (toFFI a)

  export
  new' : JSIO Headers
  new' = primJS $ Headers.prim__new undef
  
  export
  append :  (obj : Headers)
         -> (name : ByteString)
         -> (value : ByteString)
         -> JSIO ()
  append a b c = primJS $ Headers.prim__append a b c
  
  export
  delete : (obj : Headers) -> (name : ByteString) -> JSIO ()
  delete a b = primJS $ Headers.prim__delete a b
  
  export
  get : (obj : Headers) -> (name : ByteString) -> JSIO (Maybe ByteString)
  get a b = tryJS "Headers.get" $ Headers.prim__get a b
  
  export
  has : (obj : Headers) -> (name : ByteString) -> JSIO Bool
  has a b = tryJS "Headers.has" $ Headers.prim__has a b
  
  export
  set :  (obj : Headers)
      -> (name : ByteString)
      -> (value : ByteString)
      -> JSIO ()
  set a b c = primJS $ Headers.prim__set a b c

namespace Request
  
  public export
  JSType Request where
    parents =  [ Object ]

    mixins =  [ Body ]
  
  export
  new :  (input : NS I [ Request , String ])
      -> (init : Optional RequestInit)
      -> JSIO Request
  new a b = primJS $ Request.prim__new (toFFI a) (toFFI b)

  export
  new' : (input : NS I [ Request , String ]) -> JSIO Request
  new' a = primJS $ Request.prim__new (toFFI a) undef
  
  export
  cache : (obj : Request) -> JSIO RequestCache
  cache a = tryJS "Request.cache" $ Request.prim__cache a
  
  export
  credentials : (obj : Request) -> JSIO RequestCredentials
  credentials a = tryJS "Request.credentials" $ Request.prim__credentials a
  
  export
  destination : (obj : Request) -> JSIO RequestDestination
  destination a = tryJS "Request.destination" $ Request.prim__destination a
  
  export
  headers : (obj : Request) -> JSIO Headers
  headers a = primJS $ Request.prim__headers a
  
  export
  integrity : (obj : Request) -> JSIO String
  integrity a = primJS $ Request.prim__integrity a
  
  export
  isHistoryNavigation : (obj : Request) -> JSIO Bool
  isHistoryNavigation a = tryJS "Request.isHistoryNavigation"
                        $ Request.prim__isHistoryNavigation a
  
  export
  isReloadNavigation : (obj : Request) -> JSIO Bool
  isReloadNavigation a = tryJS "Request.isReloadNavigation"
                       $ Request.prim__isReloadNavigation a
  
  export
  keepalive : (obj : Request) -> JSIO Bool
  keepalive a = tryJS "Request.keepalive" $ Request.prim__keepalive a
  
  export
  method : (obj : Request) -> JSIO ByteString
  method a = primJS $ Request.prim__method a
  
  export
  mode : (obj : Request) -> JSIO RequestMode
  mode a = tryJS "Request.mode" $ Request.prim__mode a
  
  export
  redirect : (obj : Request) -> JSIO RequestRedirect
  redirect a = tryJS "Request.redirect" $ Request.prim__redirect a
  
  export
  referrer : (obj : Request) -> JSIO String
  referrer a = primJS $ Request.prim__referrer a
  
  export
  referrerPolicy : (obj : Request) -> JSIO ReferrerPolicy
  referrerPolicy a = tryJS "Request.referrerPolicy"
                   $ Request.prim__referrerPolicy a
  
  export
  signal : (obj : Request) -> JSIO AbortSignal
  signal a = primJS $ Request.prim__signal a
  
  export
  url : (obj : Request) -> JSIO String
  url a = primJS $ Request.prim__url a
  
  export
  clone : (obj : Request) -> JSIO Request
  clone a = primJS $ Request.prim__clone a

namespace Response
  
  public export
  JSType Response where
    parents =  [ Object ]

    mixins =  [ Body ]
  
  export
  new :  (body : Optional (Maybe (NS I [ ReadableStream
                                       , Blob
                                       , Int8Array
                                       , Int16Array
                                       , Int32Array
                                       , UInt8Array
                                       , UInt8Array
                                       , UInt8Array
                                       , UInt8ClampedArray
                                       , Float32Array
                                       , Float64Array
                                       , DataView
                                       , ArrayBuffer
                                       , FormData
                                       , URLSearchParams
                                       , String
                                       ])))
      -> (init : Optional ResponseInit)
      -> JSIO Response
  new a b = primJS $ Response.prim__new (toFFI a) (toFFI b)

  export
  new' : JSIO Response
  new' = primJS $ Response.prim__new undef undef
  
  export
  error : JSIO Response
  error = primJS $ Response.prim__error 
  
  export
  redirect : (url : String) -> (status : Optional UInt16) -> JSIO Response
  redirect a b = primJS $ Response.prim__redirect a (toFFI b)

  export
  redirect' : (url : String) -> JSIO Response
  redirect' a = primJS $ Response.prim__redirect a undef
  
  export
  headers : (obj : Response) -> JSIO Headers
  headers a = primJS $ Response.prim__headers a
  
  export
  ok : (obj : Response) -> JSIO Bool
  ok a = tryJS "Response.ok" $ Response.prim__ok a
  
  export
  redirected : (obj : Response) -> JSIO Bool
  redirected a = tryJS "Response.redirected" $ Response.prim__redirected a
  
  export
  status : (obj : Response) -> JSIO UInt16
  status a = primJS $ Response.prim__status a
  
  export
  statusText : (obj : Response) -> JSIO ByteString
  statusText a = primJS $ Response.prim__statusText a
  
  export
  type : (obj : Response) -> JSIO ResponseType
  type a = tryJS "Response.type" $ Response.prim__type a
  
  export
  url : (obj : Response) -> JSIO String
  url a = primJS $ Response.prim__url a
  
  export
  clone : (obj : Response) -> JSIO Response
  clone a = primJS $ Response.prim__clone a

--------------------------------------------------------------------------------
--          Mixins
--------------------------------------------------------------------------------

namespace Body
  
  export
  body : (obj : Body) -> JSIO (Maybe ReadableStream)
  body a = tryJS "Body.body" $ Body.prim__body a
  
  export
  bodyUsed : (obj : Body) -> JSIO Bool
  bodyUsed a = tryJS "Body.bodyUsed" $ Body.prim__bodyUsed a
  
  export
  arrayBuffer : (obj : Body) -> JSIO (Promise ArrayBuffer)
  arrayBuffer a = primJS $ Body.prim__arrayBuffer a
  
  export
  blob : (obj : Body) -> JSIO (Promise Blob)
  blob a = primJS $ Body.prim__blob a
  
  export
  formData : (obj : Body) -> JSIO (Promise FormData)
  formData a = primJS $ Body.prim__formData a
  
  export
  json : (obj : Body) -> JSIO (Promise AnyPtr)
  json a = primJS $ Body.prim__json a
  
  export
  text : (obj : Body) -> JSIO (Promise String)
  text a = primJS $ Body.prim__text a

--------------------------------------------------------------------------------
--          Dictionaries
--------------------------------------------------------------------------------

namespace RequestInit
  
  public export
  JSType RequestInit where
    parents =  [ Object ]

    mixins =  []
  
  export
  new :  (method : Optional ByteString)
      -> (headers : Optional (NS I [ Array (Array ByteString)
                                   , Record ByteString ByteString
                                   ]))
      -> (body : Optional (Maybe (NS I [ ReadableStream
                                       , Blob
                                       , Int8Array
                                       , Int16Array
                                       , Int32Array
                                       , UInt8Array
                                       , UInt8Array
                                       , UInt8Array
                                       , UInt8ClampedArray
                                       , Float32Array
                                       , Float64Array
                                       , DataView
                                       , ArrayBuffer
                                       , FormData
                                       , URLSearchParams
                                       , String
                                       ])))
      -> (referrer : Optional String)
      -> (referrerPolicy : Optional ReferrerPolicy)
      -> (mode : Optional RequestMode)
      -> (credentials : Optional RequestCredentials)
      -> (cache : Optional RequestCache)
      -> (redirect : Optional RequestRedirect)
      -> (integrity : Optional String)
      -> (keepalive : Optional Bool)
      -> (signal : Optional (Maybe AbortSignal))
      -> (window : Optional Any)
      -> JSIO RequestInit
  new a b c d e f g h i j k l m = primJS
                                $ RequestInit.prim__new (toFFI a)
                                                        (toFFI b)
                                                        (toFFI c)
                                                        (toFFI d)
                                                        (toFFI e)
                                                        (toFFI f)
                                                        (toFFI g)
                                                        (toFFI h)
                                                        (toFFI i)
                                                        (toFFI j)
                                                        (toFFI k)
                                                        (toFFI l)
                                                        (toFFI m)

  export
  new' : JSIO RequestInit
  new' = primJS
       $ RequestInit.prim__new undef
                               undef
                               undef
                               undef
                               undef
                               undef
                               undef
                               undef
                               undef
                               undef
                               undef
                               undef
                               undef
  
  export
  body : RequestInit -> Attribute False Optional (Maybe (Union16 ReadableStream
                                                                 Blob
                                                                 Int8Array
                                                                 Int16Array
                                                                 Int32Array
                                                                 UInt8Array
                                                                 UInt8Array
                                                                 UInt8Array
                                                                 UInt8ClampedArray
                                                                 Float32Array
                                                                 Float64Array
                                                                 DataView
                                                                 ArrayBuffer
                                                                 FormData
                                                                 URLSearchParams
                                                                 String))
  body = fromUndefOrPrimNoDefault "RequestInit.getbody" prim__body prim__setBody
  
  export
  cache : RequestInit -> Attribute False Optional RequestCache
  cache = fromUndefOrPrimNoDefault "RequestInit.getcache"
                                   prim__cache
                                   prim__setCache
  
  export
  credentials : RequestInit -> Attribute False Optional RequestCredentials
  credentials = fromUndefOrPrimNoDefault "RequestInit.getcredentials"
                                         prim__credentials
                                         prim__setCredentials
  
  export
  headers : RequestInit -> Attribute False Optional (Union2 (Array (Array ByteString))
                                                            (Record ByteString
                                                                    ByteString))
  headers = fromUndefOrPrimNoDefault "RequestInit.getheaders"
                                     prim__headers
                                     prim__setHeaders
  
  export
  integrity : RequestInit -> Attribute False Optional String
  integrity = fromUndefOrPrimNoDefault "RequestInit.getintegrity"
                                       prim__integrity
                                       prim__setIntegrity
  
  export
  keepalive : RequestInit -> Attribute False Optional Bool
  keepalive = fromUndefOrPrimNoDefault "RequestInit.getkeepalive"
                                       prim__keepalive
                                       prim__setKeepalive
  
  export
  method : RequestInit -> Attribute False Optional ByteString
  method = fromUndefOrPrimNoDefault "RequestInit.getmethod"
                                    prim__method
                                    prim__setMethod
  
  export
  mode : RequestInit -> Attribute False Optional RequestMode
  mode = fromUndefOrPrimNoDefault "RequestInit.getmode" prim__mode prim__setMode
  
  export
  redirect : RequestInit -> Attribute False Optional RequestRedirect
  redirect = fromUndefOrPrimNoDefault "RequestInit.getredirect"
                                      prim__redirect
                                      prim__setRedirect
  
  export
  referrer : RequestInit -> Attribute False Optional String
  referrer = fromUndefOrPrimNoDefault "RequestInit.getreferrer"
                                      prim__referrer
                                      prim__setReferrer
  
  export
  referrerPolicy : RequestInit -> Attribute False Optional ReferrerPolicy
  referrerPolicy = fromUndefOrPrimNoDefault "RequestInit.getreferrerPolicy"
                                            prim__referrerPolicy
                                            prim__setReferrerPolicy
  
  export
  signal : RequestInit -> Attribute False Optional (Maybe AbortSignal)
  signal = fromUndefOrPrimNoDefault "RequestInit.getsignal"
                                    prim__signal
                                    prim__setSignal
  
  export
  window : RequestInit -> Attribute False Optional Any
  window = fromUndefOrPrimNoDefault "RequestInit.getwindow"
                                    prim__window
                                    prim__setWindow

namespace ResponseInit
  
  public export
  JSType ResponseInit where
    parents =  [ Object ]

    mixins =  []
  
  export
  new :  (status : Optional UInt16)
      -> (statusText : Optional ByteString)
      -> (headers : Optional (NS I [ Array (Array ByteString)
                                   , Record ByteString ByteString
                                   ]))
      -> JSIO ResponseInit
  new a b c = primJS $ ResponseInit.prim__new (toFFI a) (toFFI b) (toFFI c)

  export
  new' : JSIO ResponseInit
  new' = primJS $ ResponseInit.prim__new undef undef undef
  
  export
  headers : ResponseInit -> Attribute False Optional (Union2 (Array (Array ByteString))
                                                             (Record ByteString
                                                                     ByteString))
  headers = fromUndefOrPrimNoDefault "ResponseInit.getheaders"
                                     prim__headers
                                     prim__setHeaders
  
  export
  status : ResponseInit -> Attribute True Optional UInt16
  status = fromUndefOrPrim "ResponseInit.getstatus"
                           prim__status
                           prim__setStatus
                           200
  
  export
  statusText : ResponseInit -> Attribute False Optional ByteString
  statusText = fromUndefOrPrimNoDefault "ResponseInit.getstatusText"
                                        prim__statusText
                                        prim__setStatusText
