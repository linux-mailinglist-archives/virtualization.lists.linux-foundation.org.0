Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 263241F535A
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 13:35:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB53386AD1;
	Wed, 10 Jun 2020 11:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4p1GL_MkaQZj; Wed, 10 Jun 2020 11:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4397786AAC;
	Wed, 10 Jun 2020 11:35:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28F52C0894;
	Wed, 10 Jun 2020 11:35:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B43D5C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A098388AD3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MULjaUWSQ0ej
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:35:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E067C882E7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591788950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=K8pYKea34n4xAOJeaGLf5FVVIvqFNqD4hPeT2vvgXYw=;
 b=QF2OTnz9kxuNasah4u4+KL7oDpaLE1I/forXxt8yF2+vBNNpKWBHG80j0tpIXY1sZpqptQ
 S5i5fLcweNfEER4kl5D0DL8ts+UN+0HWJLc+zsR5TfFnLo33R9HIQdyZ4PMsoaomRfIyTP
 Z640UA6RqpCOJbBxRhC8R3RpymGfVmo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-HdOc1KH_NH2n_tsXmnL8lQ-1; Wed, 10 Jun 2020 07:35:48 -0400
X-MC-Unique: HdOc1KH_NH2n_tsXmnL8lQ-1
Received: by mail-wm1-f70.google.com with SMTP id 11so333533wmj.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=K8pYKea34n4xAOJeaGLf5FVVIvqFNqD4hPeT2vvgXYw=;
 b=Uh46TlIUQQBxAPV6lsOaDgBymeGt4C1qvJ14SEoi+QLFXmXAfGd3yBZjFGFjReSSOO
 sSNVMKq7h0YAgs5SBQCNo9rruYMtAEs10dNZ78cvxPACXGa2rNYzoyXu0Bog08NtU0EV
 1UeOtpV2anIQNV88otWzKuQuGNH4blyMPCdGGHffCzrKLk6ehKzLo1MVB2Pw8aDRDoon
 xKzgohHBuTsHRfTZMk3kmPjgI4AvJd3PikvilShu0vEoYmcVCOPY8NpK2wgk4QR9ZSSe
 zf+5ILEkkTEziDfO/eLpy0BNdZJNp9y+YOKrC99026t3v9cK4K+vDnf4UnDW1augvbYx
 cQew==
X-Gm-Message-State: AOAM5336DZ3HCcdT+X9hHLE3L+zJsbVHCItY1jwFBnBA/s/hLXHmIJ6o
 lC70dEKoNy65UVqLUHTWuoWqgMUGss7TEXoEYtwVRmZ9lk7o3aME4bBoXFSNzpVoNndosuEhdZA
 Z3a2GqiYMojcy4zvh09nKhKq+qaaYJtd+eVCdTeDQ+w==
X-Received: by 2002:adf:f251:: with SMTP id b17mr3051839wrp.289.1591788947563; 
 Wed, 10 Jun 2020 04:35:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWnKuMQXjtn3IeBKm108U4YQm44aJFvUiXB9xS8f3b+y8TTFsSksejlRPFLR+mhd/ngiqchQ==
X-Received: by 2002:adf:f251:: with SMTP id b17mr3051819wrp.289.1591788947339; 
 Wed, 10 Jun 2020 04:35:47 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id e15sm6864302wme.9.2020.06.10.04.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 04:35:46 -0700 (PDT)
Date: Wed, 10 Jun 2020 07:35:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v7 00/14] vhost: ring format independence
Message-ID: <20200610113515.1497099-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This intentionally leaves "fixup" changes separate - hopefully
that is enough to fix vhost-net crashes reported here,
but it helps me keep track of what changed.
I will naturally squash them later when we are done.


This adds infrastructure required for supporting
multiple ring formats.

The idea is as follows: we convert descriptors to an
independent format first, and process that converting to
iov later.

Used ring is similar: we fetch into an independent struct first,
convert that to IOV later.

The point is that we have a tight loop that fetches
descriptors, which is good for cache utilization.
This will also allow all kind of batching tricks -
e.g. it seems possible to keep SMAP disabled while
we are fetching multiple descriptors.

For used descriptors, this allows keeping track of the buffer length
without need to rescan IOV.

This seems to perform exactly the same as the original
code based on a microbenchmark.
Lightly tested.
More testing would be very much appreciated.

changes from v6:
	- fixes some bugs introduced in v6 and v5

changes from v5:
	- addressed comments by Jason: squashed API changes, fixed up discard

changes from v4:
	- added used descriptor format independence
	- addressed comments by jason
	- fixed a crash detected by the lkp robot.

changes from v3:
        - fixed error handling in case of indirect descriptors
        - add BUG_ON to detect buffer overflow in case of bugs
                in response to comment by Jason Wang
        - minor code tweaks

Changes from v2:
	- fixed indirect descriptor batching
                reported by Jason Wang

Changes from v1:
	- typo fixes


Michael S. Tsirkin (14):
  vhost: option to fetch descriptors through an independent struct
  fixup! vhost: option to fetch descriptors through an independent
    struct
  vhost: use batched get_vq_desc version
  vhost/net: pass net specific struct pointer
  vhost: reorder functions
  vhost: format-independent API for used buffers
  fixup! vhost: format-independent API for used buffers
  fixup! vhost: use batched get_vq_desc version
  vhost/net: convert to new API: heads->bufs
  vhost/net: avoid iov length math
  vhost/test: convert to the buf API
  vhost/scsi: switch to buf APIs
  vhost/vsock: switch to the buf API
  vhost: drop head based APIs

 drivers/vhost/net.c   | 174 +++++++++----------
 drivers/vhost/scsi.c  |  73 ++++----
 drivers/vhost/test.c  |  22 +--
 drivers/vhost/vhost.c | 378 +++++++++++++++++++++++++++---------------
 drivers/vhost/vhost.h |  44 +++--
 drivers/vhost/vsock.c |  30 ++--
 6 files changed, 439 insertions(+), 282 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
