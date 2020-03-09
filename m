Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6717DA48
	for <lists.virtualization@lfdr.de>; Mon,  9 Mar 2020 09:08:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17AFB80657;
	Mon,  9 Mar 2020 08:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxh9vD12lBUF; Mon,  9 Mar 2020 08:08:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E6B5869FD;
	Mon,  9 Mar 2020 08:08:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5C07C18D3;
	Mon,  9 Mar 2020 08:08:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D1C8C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 08:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 60C84203BE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 08:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4dk7OAgA-dj
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 08:08:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 41DB6203BD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583741315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=T8KT/+n14Cn5HelmWM4TG6Zo6L21o7FLn2E43AQONUI=;
 b=I7sjVMFrQyszBieK7l81PBbXu3hkzHcGu1wuxeWxaxy9mt8RSC0xHZHxIpqw6fCdX+kdjD
 LJZeHKJOz3OCKFK+WvKMsJJkcgBYPptT+LM8wEl1p8plGMF4Dxb8a7S9QVfzUbhds9JWPM
 eFNtJt5Hel2J2my9omQ3Hwovm7F6RS4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-2U0mrg9TNxOJv1e4ummcVA-1; Mon, 09 Mar 2020 04:08:32 -0400
X-MC-Unique: 2U0mrg9TNxOJv1e4ummcVA-1
Received: by mail-qt1-f197.google.com with SMTP id y3so6295823qti.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Mar 2020 01:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=T8KT/+n14Cn5HelmWM4TG6Zo6L21o7FLn2E43AQONUI=;
 b=ClXTGNvBvZ6pAvQDnAgfCE5RbyQypTv6BRlu0ex21GztKPZa694AcddaAo8FeGUXqN
 hAglJUle7XwOkyQiAimvYXaCtzq6OmzywDaImaCEkLEZGyDWOIfBdSgLcKdjLopBL9we
 xbceJC8MO02lvAHn33r4eqh46bw+D5D/+PPJGyer5/3ShmAGkOPO5yrJrZ5uUGmHo6cY
 EgwCcoW1JxSW+X3QzUCx+3IdTg17AccZdDQBnKTRMgx3TE6b6UHA5OIAMtFyaPOnLCni
 JjA6XCVoQru/AnvsY6WZBBw4d1nipEeY1v+5CtewaVfbZ/uHjfAGfvYyUyrHuSjyeqTc
 eQjA==
X-Gm-Message-State: ANhLgQ0T1of/IWBYe2tIZU6F6+ZIjK+tVrQLjlSWSvOTlg7Mx5a/A6Ok
 bDAJih0zF1eOYkK3ttSyMGmUPZ54duw1mqrkF1t45UdgL1yQS8PGMxhWZaTsDNCG3v6XNZ44GsV
 aM8yzt8T5KOlDSY4n+iuYgSfUz+UeXf+oWdexMoYHtw==
X-Received: by 2002:a0c:c244:: with SMTP id w4mr13815577qvh.104.1583741311602; 
 Mon, 09 Mar 2020 01:08:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsDCYFx3tgEt/18zqy2Hj0onYaUrEMtYoBKu3yJ+l1tw+IzBr80xlV0fKvKv/QcwEaRhnxGPw==
X-Received: by 2002:a0c:c244:: with SMTP id w4mr13815565qvh.104.1583741311386; 
 Mon, 09 Mar 2020 01:08:31 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id k11sm21885175qti.68.2020.03.09.01.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 01:08:30 -0700 (PDT)
Date: Mon, 9 Mar 2020 04:08:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] virtio: fixes
Message-ID: <20200309040825-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: axboe@kernel.dk, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 natechancellor@gmail.com, s-anna@ti.com
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

The following changes since commit 98d54f81e36ba3bf92172791eba5ca5bd813989b:

  Linux 5.6-rc4 (2020-03-01 16:38:46 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 6ae4edab2fbf86ec92fbf0a8f0c60b857d90d50f:

  virtio_balloon: Adjust label in virtballoon_probe (2020-03-08 05:35:24 -0400)

----------------------------------------------------------------
virtio: fixes

Some bug fixes all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Halil Pasic (2):
      virtio-blk: fix hw_queue stopped on arbitrary error
      virtio-blk: improve virtqueue error to BLK_STS

Nathan Chancellor (1):
      virtio_balloon: Adjust label in virtballoon_probe

Suman Anna (1):
      virtio_ring: Fix mem leak with vring_new_virtqueue()

 drivers/block/virtio_blk.c      | 17 ++++++++++++-----
 drivers/virtio/virtio_balloon.c |  2 +-
 drivers/virtio/virtio_ring.c    |  4 ++--
 3 files changed, 15 insertions(+), 8 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
