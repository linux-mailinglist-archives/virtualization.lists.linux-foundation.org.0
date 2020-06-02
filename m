Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6841EBC59
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:06:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F47D860C9;
	Tue,  2 Jun 2020 13:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7-U9Dg8O1-Z; Tue,  2 Jun 2020 13:06:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04B2B85B80;
	Tue,  2 Jun 2020 13:06:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF9B2C016E;
	Tue,  2 Jun 2020 13:06:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A765C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5168A203FE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgJ6hvl7TdH0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id D06332014A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591103159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vdmj+Tg8SGx2NrYVAizct++/zxOMWuxvcR8U68lSB2Q=;
 b=Xy2qJhbjXoyS70Z86Z5bNfgNPwUttpmJ6dVZ8IF+MteBfqU2aQFQQ0CmT3r5lESWZVB9kS
 ckU6rnubx4qZkypXiWORAHNmc6sJAsrW5iE2s9x2NfVAX6EoVFSmK/zE2DaEGtlwxxUEbB
 wA5CkJO02FJwjJ/AoS+nSmyK5ezmd80=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-nQ3gE4V4Mdy15snDDYEQVw-1; Tue, 02 Jun 2020 09:05:57 -0400
X-MC-Unique: nQ3gE4V4Mdy15snDDYEQVw-1
Received: by mail-wm1-f70.google.com with SMTP id h25so891387wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=vdmj+Tg8SGx2NrYVAizct++/zxOMWuxvcR8U68lSB2Q=;
 b=Gt6CJthfdy7FBqxNfOvsDIynd2uFynrcafaXOwRbvOpQYJbW+VI8pIWZtRW64mMQXA
 Nsflk48yq//NfY++jiQFL1uKgbK/mJ9DDtRdukB0O1vY/1DTRNchVyz2urAc8Aps3JbR
 3hiX+9pNDmaT5gAlNvdXZK6N1SJrTHbhy8THC0TAKK5GDSIhG3gLOAbOXQ2eZ1Dt8M8u
 StxAEk6MTfDctPfVPcIE3RQf4H6nw1systX7i6WIgKBN6AK5MFgWLQaEYBEkrPfIJ40z
 oI8qa8myNPYgfVP8h3iPdof6yEWgaNgYkSUGmeMOo+dBeD6AYA3bshtADy5j+ckVvzzc
 cRZA==
X-Gm-Message-State: AOAM532jbpajKh94vrsFWdrdHcLJrOFWDsUU9lrddPPOw5rOKLo3Z2FP
 VdGDv+Kh/ojpBF016XjDyvCrcnVGXApaB6h3vBGZ2HDcKKUMTqnfuecnuHjO8vMgn5WJkdA9qRh
 k5oD9eJuh5zmt496ofPagZ9u2FQc5jxFGYtgXwBOSpA==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr3952751wmh.1.1591103156752;
 Tue, 02 Jun 2020 06:05:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxhvL+9CoWDlbet28l8cBoDZ1y4Jq12uY4hkhtEZgSR8vXHFkGEgf8rds3ZCLy2cNng3Lahg==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr3952727wmh.1.1591103156470;
 Tue, 02 Jun 2020 06:05:56 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 5sm3408485wmz.16.2020.06.02.06.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:05:55 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:05:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 00/13] vhost: format independence
Message-ID: <20200602130543.578420-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

We let the specifics of the ring format seep through to vhost API
callers - mostly because there was only one format so it was
hard to imagine what an independent API would look like.
Now that there's an alternative in form of the packed ring,
it's easier to see the issues, and fixing them is perhaps
the cleanest way to add support for more formats.

This patchset does this by indtroducing two new structures: vhost_buf to
represent a buffer and vhost_desc to represent a descriptor.
Descriptors aren't normally of interest to devices but do occationally
get exposed e.g. for logging.

Perhaps surprisingly, the higher level API actually makes things a bit
easier for callers, as well as allows more freedom for the vhost core.
The end result is basically unchanged performance (based on preliminary
testing) even though we are forced to go through a format conversion.

The conversion also exposed (more) bugs in vhost scsi - which isn't
really surprising, that driver needs a lot more love than it's getting.

Very lightly tested. Would appreciate feedback and testing.

Michael S. Tsirkin (13):
  vhost: option to fetch descriptors through an independent struct
  vhost: use batched version by default
  vhost: batching fetches
  vhost: cleanup fetch_buf return code handling
  vhost/net: pass net specific struct pointer
  vhost: reorder functions
  vhost: format-independent API for used buffers
  vhost/net: convert to new API: heads->bufs
  vhost/net: avoid iov length math
  vhost/test: convert to the buf API
  vhost/scsi: switch to buf APIs
  vhost/vsock: switch to the buf API
  vhost: drop head based APIs

 drivers/vhost/net.c   | 173 +++++++++----------
 drivers/vhost/scsi.c  |  73 ++++----
 drivers/vhost/test.c  |  22 +--
 drivers/vhost/vhost.c | 375 +++++++++++++++++++++++++++---------------
 drivers/vhost/vhost.h |  46 ++++--
 drivers/vhost/vsock.c |  30 ++--
 6 files changed, 436 insertions(+), 283 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
