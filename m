Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0AB1F66B9
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:34:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5CBEC88682;
	Thu, 11 Jun 2020 11:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4H0-nflNndf; Thu, 11 Jun 2020 11:34:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43A58885CC;
	Thu, 11 Jun 2020 11:34:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CAC5C016F;
	Thu, 11 Jun 2020 11:34:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15ED6C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1119D88392
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1vULKHjpBe2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EF4268832A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kvOkZNSYFeD+43Sy08lFqOoYp/OFi1aiv2h8v9KKAP4=;
 b=IIkGrVvi7FIAgdX7IBt7U/UUPKj9FmXSb+gYutiJ/+i0HlVulU6ur9PlMktRZTt+igt/QO
 2g5ZCBqtvTpgLrlOW05uLvrZ+l4l5X3W5yoHFTr846PYg897ewU26npDcWrezxrngacjqA
 zmjuRdbZDQxsc6dJTDma2Bw5Z2X1fEQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-Vpog70BEN-uPFj2gYKvOPA-1; Thu, 11 Jun 2020 07:34:17 -0400
X-MC-Unique: Vpog70BEN-uPFj2gYKvOPA-1
Received: by mail-wr1-f72.google.com with SMTP id m14so2448753wrj.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=kvOkZNSYFeD+43Sy08lFqOoYp/OFi1aiv2h8v9KKAP4=;
 b=Ad8L04r1rPId6o74Lc04J0wE2KrEAVZuvyjB2fDkhpL5sErVyu4HTrAjpGDHrjigBv
 WV3jiLR/Yof0QVDIzUScantbaFxZMbFOzmETa3nxaKCs1NCNjb6kcQ0OAA+kEPf/qpkl
 yIxtcCoGxo5TeVO5JNCSYiGaHGSnMokurAo9sQjgAfH9L23ZvBrVc91jfYbcpcWdAZlR
 dW+Nw5LPN/vfmkb3IgU5CZSdY+ceySHq6WueUCo4OhdfHS8SLD71+LKbi7zD1+0Af3IO
 bGtkE6A/Lg7Xiwl+g/BD9HAcGYYSBkLKSeY2bDRS5WkupIBI7lxZGuYBtKtGCpyoZHoZ
 iT2g==
X-Gm-Message-State: AOAM532Q6oB7IZK6oBig0gdAOX/F/s3gBMOTGVjFGSA47KfivwsMtvWU
 Y5SM6fk84wPRVyiakEnzCXgFIxdhZL3+r9Ty4hL/gGaNqwq/0FzTotcsWoPhEHW9biKNdXtm9gh
 HRoLbozqFq6CYEwcwD4skvLGw6nAihTV4uf1Oj9fOfA==
X-Received: by 2002:adf:afc7:: with SMTP id y7mr9022433wrd.173.1591875256652; 
 Thu, 11 Jun 2020 04:34:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMVwGtIAyLyKuJe/rvxpW01IwwfuztK2wzsTcAeYYTwafjhy8A/SBGUsb9zgk1wtRdA+tFzQ==
X-Received: by 2002:adf:afc7:: with SMTP id y7mr9022405wrd.173.1591875256447; 
 Thu, 11 Jun 2020 04:34:16 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id k12sm4673844wrn.42.2020.06.11.04.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:34:15 -0700 (PDT)
Date: Thu, 11 Jun 2020 07:34:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v8 00/11] vhost: ring format independence
Message-ID: <20200611113404.17810-1-mst@redhat.com>
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


This still causes corruption issues for people so don't try
to use in production please. Posting to expedite debugging.

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

changes from v8:
	- squashed in fixes. no longer hangs but still known
	  to cause data corruption for some people. under debug.

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


Michael S. Tsirkin (11):
  vhost: option to fetch descriptors through an independent struct
  vhost: use batched get_vq_desc version
  vhost/net: pass net specific struct pointer
  vhost: reorder functions
  vhost: format-independent API for used buffers
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
