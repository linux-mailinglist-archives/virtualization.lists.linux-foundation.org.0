Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EB107F8B
	for <lists.virtualization@lfdr.de>; Sat, 23 Nov 2019 17:56:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A675875EB;
	Sat, 23 Nov 2019 16:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRCS4k4jlgKY; Sat, 23 Nov 2019 16:56:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A54A8760D;
	Sat, 23 Nov 2019 16:56:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 774BCC087F;
	Sat, 23 Nov 2019 16:56:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 809C1C087F
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 16:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6CF8886A8C
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 16:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPdMSR2JmAs8
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 16:56:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A37D08618D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574528162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2zzmCXVL6/qiRxw5VRJxtFFVEelD3xq1/ujpmzsTxFU=;
 b=N0KpR7BHS1PXetqbXYk69q7Wdql/tvn5iT0eXHe+mziQyxEDaac5FvhOLtots08OARkqbM
 2dkDLDVd+2RJSXHi2GoqtSdc4CQyewr1KOaUsfLTEVHbfY73IhVGba/fltPPWR0iTXmjyA
 HkAQRG5p+6fpifNSQ3PeC8LYPTH/Mvk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-l7mzovv4OHKxqHjTdy6sYg-1; Sat, 23 Nov 2019 11:55:59 -0500
Received: by mail-qk1-f199.google.com with SMTP id j1so5178605qkk.17
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 08:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=oUPi4IjzCEcsGqjHvxV40TwATuFQ6qhdtMszb+yQ4YA=;
 b=O6u00nu4YcxmxGCbi5d6lGQEwi5v5CG34B/snlSfQ6UHlJjFb9L4kiB8q8jCUQV226
 7VOVBgIcY9FsAsorkcYeW/CiU77A61UDTA/4cQaPrBVKQRZh/dR8KXFU0UMW6h5jhKkn
 7O4HThxP8aRCgCtdbzgYLK72oy9YGzQCdYNkwvqURefxj/JDPZx4vv+fbg7Fq+YOy+VU
 i9nAsaPuolGsmt0a4JZt/Bc/Vy3Vd3NrzUCx5eXYTWwpWGJctZOmr1bNOBREiroQjTQE
 jINgYq+3eSAMeFlhVAyOZijd6alcenE0pWoOSXTytp7O0D0S2P7CKbfyCLJ+pArT3TTJ
 eWeQ==
X-Gm-Message-State: APjAAAXa2p/71Gr3mD2oKsC+wqmhMhRGy5v8EHiUQns2LYSG+gRGmqq0
 ier2VWiEzHhxi7aJP1P2YkxqrZf70scffGS/7js8EaxEhawEa/7ztDXaI0HTYD1fQ4eutsDLWxw
 09Zie2C8fJuaUR3u1atVraOwQ0ttLW0HySLOV8wPpdg==
X-Received: by 2002:ac8:109:: with SMTP id e9mr10744678qtg.233.1574528158702; 
 Sat, 23 Nov 2019 08:55:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5oU6z7kIgkAY+TdwrAkagYjcdcvZ06XXDl+M6D2/wPofNwFAEDJeY+TKLUO56xn44s6qvMg==
X-Received: by 2002:ac8:109:: with SMTP id e9mr10744651qtg.233.1574528158492; 
 Sat, 23 Nov 2019 08:55:58 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id a3sm618985qkd.67.2019.11.23.08.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2019 08:55:57 -0800 (PST)
Date: Sat, 23 Nov 2019 11:55:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] virtio: last minute bugfixes
Message-ID: <20191123115552-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-MC-Unique: l7mzovv4OHKxqHjTdy6sYg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: lvivier@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, khazhy@google.com,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 mimu@linux.ibm.com
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

The following changes since commit af42d3466bdc8f39806b26f593604fdc54140bcb:

  Linux 5.4-rc8 (2019-11-17 14:47:30 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to c9a6820fc0da2603be3054ee7590eb9f350508a7:

  virtio_balloon: fix shrinker count (2019-11-20 02:15:57 -0500)

----------------------------------------------------------------
virtio: last minute bugfixes

Minor bugfixes all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Halil Pasic (1):
      virtio_ring: fix return code on DMA mapping fails

Laurent Vivier (1):
      virtio_console: allocate inbufs in add_port() only if it is needed

Michael S. Tsirkin (1):
      virtio_balloon: fix shrinker scan number of pages

Wei Wang (1):
      virtio_balloon: fix shrinker count

 drivers/char/virtio_console.c   | 28 +++++++++++++---------------
 drivers/virtio/virtio_balloon.c | 20 +++++++++++++-------
 drivers/virtio/virtio_ring.c    |  4 ++--
 3 files changed, 28 insertions(+), 24 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
