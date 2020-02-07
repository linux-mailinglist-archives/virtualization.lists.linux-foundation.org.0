Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C75155319
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 08:39:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 37A9F84177;
	Fri,  7 Feb 2020 07:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHbtWJQipQ0R; Fri,  7 Feb 2020 07:39:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AD1D484439;
	Fri,  7 Feb 2020 07:39:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 982ADC1D87;
	Fri,  7 Feb 2020 07:39:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DF73C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 275B687D63
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8sz3L5osLksX
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:39:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8932487D5E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581061183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=RcFKRVH3gHcLtkguVIqSG7BD20vX1d23epKBziWPU6c=;
 b=Fxjsp6m+uCAM3emwz44JYgWHIJQ1zWniuwJYt2/J817mtmQqDi2Bai4v6pOqyYKLOxXRMC
 JyKDxEEuKX9SdRnpRZaFd6wwiQQhuTwXytD/7BrXd4i8GAze0nKXs/HfgyWIlZ60S+UVRB
 ZesopipDyFwfjFo7BmR1JXO3ECWxIlw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-1i8eWJ6ePImzc3e3kvvpfQ-1; Fri, 07 Feb 2020 02:39:40 -0500
Received: by mail-qt1-f199.google.com with SMTP id e37so1121933qtk.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 23:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=RcFKRVH3gHcLtkguVIqSG7BD20vX1d23epKBziWPU6c=;
 b=Gk/OQ+LGVeLqPjhk2euJEcUigYEJ02Mpqo8r/Kz2TGWbHQ+KX0z5RE10EQ8vchXVah
 9dx/YrPejGwm7jEFt1IsfaMBawPAPeGbxTpzHyzeh8L9Pmqnq5V5v090U88IjJvHawYq
 bOlckKrazQik1AxwZhfcidkzO10AJv6n0r4QimH6OAPofFhwk8VJtCdjqYzGfNfAmigc
 sZHTpNn4yoF75OOVLNxgpp4kWmpC0oO4pzdapubc0qZaUpYlVtyDhgPLQZYFUnyquPhK
 fn5JQ/20S7kS15JppNIU5FwIrpIoj7zMdk/tERlct5YkHFyLGPa8+LlbTZdD+VyJ+jov
 szcw==
X-Gm-Message-State: APjAAAUA/XWHFTT0gbSTH9JmHs7ou0VZkRPmmKyV1yI6ugsPD+RzKi9O
 ltJqyh9IaZye2LrCnAZMXqDjh6GRsjpjTveGTZr3qj2QaxI057DUf/U+2FsMTy3JsQMol0w1BCP
 gCdsm4Fg2j2n4okyfsf/JQ41IfJw5Kh9qyjeOTGUcyg==
X-Received: by 2002:a37:9d44:: with SMTP id g65mr5720055qke.15.1581061177577; 
 Thu, 06 Feb 2020 23:39:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvlU4UHQxzfEkAS6QVFgWyB0SgQq/f941PosR7MwjPxpZPuvIbWXRXdzhsS2Ms7GKdNUUy8Q==
X-Received: by 2002:a37:9d44:: with SMTP id g65mr5720033qke.15.1581061177340; 
 Thu, 06 Feb 2020 23:39:37 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id 65sm980218qtc.4.2020.02.06.23.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 23:39:36 -0800 (PST)
Date: Fri, 7 Feb 2020 02:39:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost: cleanups and fixes
Message-ID: <20200207023932-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-MC-Unique: 1i8eWJ6ePImzc3e3kvvpfQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, tiny.windzz@gmail.com, netdev@vger.kernel.org,
 liang.z.li@intel.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, mst@redhat.com,
 "Cc:stable"@vger.kernel.org, hch@lst.de
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

The following changes since commit d5226fa6dbae0569ee43ecfc08bdcd6770fc4755:

  Linux 5.5 (2020-01-26 16:23:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 1ad6f58ea9364b0a5d8ae06249653ac9304a8578:

  virtio_balloon: Fix memory leaks on errors in virtballoon_probe() (2020-02-06 03:40:27 -0500)

----------------------------------------------------------------
virtio: fixes, cleanups

Some bug fixes/cleanups.
Deprecated scsi passthrough for blk removed.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Christoph Hellwig (1):
      virtio-blk: remove VIRTIO_BLK_F_SCSI support

Daniel Verkamp (2):
      virtio-balloon: initialize all vq callbacks
      virtio-pci: check name when counting MSI-X vectors

David Hildenbrand (2):
      virtio-balloon: Fix memory leak when unloading while hinting is in progress
      virtio_balloon: Fix memory leaks on errors in virtballoon_probe()

Michael S. Tsirkin (1):
      virtio_balloon: prevent pfn array overflow

Yangtao Li (1):
      virtio-mmio: convert to devm_platform_ioremap_resource

 arch/powerpc/configs/guest.config  |   1 -
 drivers/block/Kconfig              |  10 ----
 drivers/block/virtio_blk.c         | 115 +------------------------------------
 drivers/virtio/virtio_balloon.c    |  21 +++++--
 drivers/virtio/virtio_mmio.c       |  15 +----
 drivers/virtio/virtio_pci_common.c |   2 +-
 6 files changed, 22 insertions(+), 142 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
