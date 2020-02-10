Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D03156F05
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 07:03:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A64EF852D5;
	Mon, 10 Feb 2020 06:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7gFweKlSfXw; Mon, 10 Feb 2020 06:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A6C8852FE;
	Mon, 10 Feb 2020 06:03:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D872C0171;
	Mon, 10 Feb 2020 06:03:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A923C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 06:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 81AA086FB0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 06:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjdvhjvldZ5a
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 06:03:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AF42E86FAD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 06:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581314589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=RcFKRVH3gHcLtkguVIqSG7BD20vX1d23epKBziWPU6c=;
 b=Sk75dtVOux6IkcIZ5fKCDJe1lzcgpdT1MyzNGKzTPnA4wdrOr7m+SUhzM+EuVAllttoLL3
 0LtVZKqjS6uXgQ66bFzHNyzkz9rmJyQZ9CUJ7ZXLIXqR0w9m2tvX2w6EJSJN8ey3+C4r3h
 g7lMM4PjEhFyep7EXT9IiARjWNtPEKk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-_6m5J7zuOgmh5EYgfXBn5w-1; Mon, 10 Feb 2020 01:03:02 -0500
Received: by mail-qk1-f200.google.com with SMTP id i135so4114661qke.14
 for <virtualization@lists.linux-foundation.org>;
 Sun, 09 Feb 2020 22:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=RcFKRVH3gHcLtkguVIqSG7BD20vX1d23epKBziWPU6c=;
 b=ifLrqf1Mul3Z5Nx3IKWva3aYuHO6j4DvMEWDtHyqEpnjF1b1RrsBe4G2Mlngex6DLs
 /72WRZkjH9k6jGcHgyC88YB1fRRjyexpofLobPr0Oa7dECn8gR5h55vH+QUROhPv3P+L
 cK7dffYTvI9jqequ1/85bG4QjloFoBTKu6NrgW4b01ALUOSnT9yPeBvqDdMz4JdsaX9x
 FCcpb58E0qg/1HjKagbflgOlL8MdF7WAF17vpu77mE+4kr+2yHxRxxpGKCAPQ7Dsj5j9
 tsXOjZvS+3J2neTPt/NQmut7Wt0BDGouxl7N+w3vUHuMBZSdJu1FW10BxVo1o8IvofqK
 R1BQ==
X-Gm-Message-State: APjAAAUK4wg5WFYcGyf6+dYueu8Y7XZrVVd080vLtB4/YhI/K4ckj0+E
 h+sa1jEGLKFZMam3sNMCBlRbIWxnS6c3kbRbe8xC+gmFJY8+FaWXhvIQ1qVXvXzBUbJqi+I/4VA
 cdZRQg6zFjSlSqY+w/EHFNTplSKriRtp47g34okvrOQ==
X-Received: by 2002:a37:a78d:: with SMTP id q135mr8820933qke.158.1581314579779; 
 Sun, 09 Feb 2020 22:02:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLQtB8yl/m+BacFLWn43D0b4n9BJNjjg/xGBS5WoFgX11DA5iZMACnkcaJ6mBMaeTlDKc5qw==
X-Received: by 2002:a37:a78d:: with SMTP id q135mr8820902qke.158.1581314579453; 
 Sun, 09 Feb 2020 22:02:59 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id d17sm5311352qkc.9.2020.02.09.22.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 22:02:58 -0800 (PST)
Date: Mon, 10 Feb 2020 01:02:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost: cleanups and fixes
Message-ID: <20200210010252-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-MC-Unique: _6m5J7zuOgmh5EYgfXBn5w-1
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
