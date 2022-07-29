# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Copyright (c) 2021 Z-Shell Community
#
# According to the Zsh Plugin Standard:
# https://z.digitalclouds.dev/community/zsh_plugin_standard/#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://z.digitalclouds.dev/community/zsh_plugin_standard/#funtions-directory
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

# https://z.digitalclouds.dev/community/zsh_plugin_standard/#the-proposed-function-name-prefixes

#autoload -Uz .za-bgn-bin-or-src-function-body .za-bgn-bin-or-src-function-body-cygwin \
#.za-bgn-mod-function-body →za-bgn-atload-handler →za-bgn-atclone-handler \
#→za-bgn-atpull-handler →za-bgn-atdelete-handler \
#→za-bgn-help-handler →za-bgn-shim-list

autoload -Uz "${0:h}/functions"/*(.:t)

# An empty stub to fill the help handler fields
→za-bgn-null-handler() { :; }

@zi-register-annex "z-a-bin-gem-node" subcommand:shim-list \
  →za-bgn-shim-list \
  →za-bgn-help-handler

@zi-register-annex "z-a-bin-gem-node" hook:\!atload-50 \
  →za-bgn-atload-handler \
  →za-bgn-null-handler "fbin''|sbin|sbin''|gem''|node''|pip''|fmod''|fsrc''|ferc''" # also register new ices

@zi-register-annex "z-a-bin-gem-node" hook:atclone-50 \
  →za-bgn-atclone-handler \
  →za-bgn-null-handler

@zi-register-annex "z-a-bin-gem-node" hook:\%atpull-50 \
  →za-bgn-atclone-handler \
  →za-bgn-null-handler

@zi-register-annex "z-a-bin-gem-node" hook:atdelete-50 \
  →za-bgn-atdelete-handler \
  →za-bgn-null-handler
