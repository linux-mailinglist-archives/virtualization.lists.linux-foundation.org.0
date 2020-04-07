Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 200341A0A7B
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 11:53:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CCFF387E6E;
	Tue,  7 Apr 2020 09:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F0NjHLhP+Xqg; Tue,  7 Apr 2020 09:53:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D80D387E80;
	Tue,  7 Apr 2020 09:53:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4088C0177;
	Tue,  7 Apr 2020 09:53:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3510EC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 09:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1DBC1865E0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 09:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRn4RgLXH8lJ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 09:53:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D19E2865DB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586253220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=oLjV0dR06CVtDijV8G+MbnTLMMQSd3QfbOWe/4e1HKY=;
 b=i1PKqifD4QGR8wH/WYuRMB7V80Tkg7h1YcxXwGZLZI/xiVxN8wyqgxJSePsYD+513q70Bt
 d7+S63CqIlA9jH+Qdwq3d0v0wbpOVkD9bNRz9RtunQDrQVS+CP266XK7OziE658E+VXjZf
 DrmAv58awp7YBhM0fASCHKfjfs1xCWM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-NCi7FESkN6y3EIuEOghhTQ-1; Tue, 07 Apr 2020 05:53:38 -0400
X-MC-Unique: NCi7FESkN6y3EIuEOghhTQ-1
Received: by mail-wr1-f72.google.com with SMTP id g6so1482627wru.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Apr 2020 02:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=oLjV0dR06CVtDijV8G+MbnTLMMQSd3QfbOWe/4e1HKY=;
 b=ZeS/9LiMyEZVOSsxzfZfXyIhk3h7GsiueYOZ+ypoCeERTAY9cBBrfkYrewYtxf+YM9
 vu0ESM1fBZ3jAuxVM5vRgJQhGiYW0wMft7RXizVqmiD4bVibTNppV1nrdqVQedEG18AI
 oiaqI85qlci3cjbzlBBeVGZwAY0J5I61gda+n0DfBAQtaYKB+8NFNu26r6sG4DT4qpox
 sF7vjjuZ6qa6XRmNIXtoW2XLcUC20NqePEw1v8Z0xJntlZALTC3zu9FZ68Cqtq82V7ZP
 z4+9fonhCDdN+oZtywNMLX8qTQV7ADv/U4BLyU2aMmhzjtcVVVPsUtnatx3dU5LZHWar
 suEA==
X-Gm-Message-State: AGi0PuYBvG8pSCEj6xxR87pGfO8TWvShGorytSvZC8cQ/YKLMoz5s41N
 tZiOJvbviQVvLxYWjJzcu4ucMg8WRdArKi56UwdyH/ao5KvmIZdT3miOLOBVg3cIeEgBhkotiif
 wQxDAeMM/5OurmjZ2uj7QOhOI9SMjzlNBn1FKDvyjXQ==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr1517475wmc.101.1586253217556; 
 Tue, 07 Apr 2020 02:53:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypK618C35lkaLXiYs/X9jCrBU5V7/q45Do9tU/BXiD39k7buPrgl8FVD4cfYPT2PEopWOaQJtQ==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr1517441wmc.101.1586253217223; 
 Tue, 07 Apr 2020 02:53:37 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id v7sm30308497wrs.96.2020.04.07.02.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 02:53:36 -0700 (PDT)
Date: Tue, 7 Apr 2020 05:53:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL v2] vhost: cleanups and fixes
Message-ID: <20200407055334-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: rdunlap@infradead.org, tiwei.bie@intel.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, tysand@google.com,
 eperezma@redhat.com, xiao.w.wang@intel.com, namit@vmware.com,
 rientjes@google.com, yuri.benditovich@daynix.com,
 alexander.h.duyck@linux.intel.com, mhocko@kernel.org, lingshan.zhu@intel.com
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

Changes from PULL v1:
	reverted a commit that was also in Andrew Morton's tree,
	to resolve a merge conflict:
	this is what Stephen Rothwell was doing to resolve it
	in linux-next.


Now that many more architectures build vhost, a couple of these (um, and
arm with deprecated oabi) have reported build failures with randconfig,
however fixes for that need a bit more discussion/testing and will be
merged separately.

Not a regression - these previously simply didn't have vhost at all.
Also, there's some DMA API code in the vdpa simulator is hacky - if no
solution surfaces soon we can always disable it before release:
it's not a big deal either way as it's just test code.


The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 835a6a649d0dd1b1f46759eb60fff2f63ed253a7:

  virtio-balloon: Revert "virtio-balloon: Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM" (2020-04-07 05:44:57 -0400)

----------------------------------------------------------------
virtio: fixes, vdpa

Some bug fixes.
The new vdpa subsystem with two first drivers.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
David Hildenbrand (1):
      virtio-balloon: Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM

Jason Wang (7):
      vhost: refine vhost and vringh kconfig
      vhost: allow per device message handler
      vhost: factor out IOTLB
      vringh: IOTLB support
      vDPA: introduce vDPA bus
      virtio: introduce a vDPA based transport
      vdpasim: vDPA device simulator

Michael S. Tsirkin (3):
      tools/virtio: option to build an out of tree module
      vdpa: move to drivers/vdpa
      virtio-balloon: Revert "virtio-balloon: Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM"

Tiwei Bie (1):
      vhost: introduce vDPA-based backend

Yuri Benditovich (3):
      virtio-net: Introduce extended RSC feature
      virtio-net: Introduce RSS receive steering feature
      virtio-net: Introduce hash report feature

Zhu Lingshan (1):
      virtio: Intel IFC VF driver for VDPA

 MAINTAINERS                      |   3 +
 arch/arm/kvm/Kconfig             |   2 -
 arch/arm64/kvm/Kconfig           |   2 -
 arch/mips/kvm/Kconfig            |   2 -
 arch/powerpc/kvm/Kconfig         |   2 -
 arch/s390/kvm/Kconfig            |   4 -
 arch/x86/kvm/Kconfig             |   4 -
 drivers/Kconfig                  |   4 +
 drivers/Makefile                 |   1 +
 drivers/misc/mic/Kconfig         |   4 -
 drivers/net/caif/Kconfig         |   4 -
 drivers/vdpa/Kconfig             |  37 ++
 drivers/vdpa/Makefile            |   4 +
 drivers/vdpa/ifcvf/Makefile      |   3 +
 drivers/vdpa/ifcvf/ifcvf_base.c  | 389 +++++++++++++++++
 drivers/vdpa/ifcvf/ifcvf_base.h  | 118 ++++++
 drivers/vdpa/ifcvf/ifcvf_main.c  | 435 +++++++++++++++++++
 drivers/vdpa/vdpa.c              | 180 ++++++++
 drivers/vdpa/vdpa_sim/Makefile   |   2 +
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 629 ++++++++++++++++++++++++++++
 drivers/vhost/Kconfig            |  45 +-
 drivers/vhost/Kconfig.vringh     |   6 -
 drivers/vhost/Makefile           |   6 +
 drivers/vhost/iotlb.c            | 177 ++++++++
 drivers/vhost/net.c              |   5 +-
 drivers/vhost/scsi.c             |   2 +-
 drivers/vhost/vdpa.c             | 883 +++++++++++++++++++++++++++++++++++++++
 drivers/vhost/vhost.c            | 233 ++++-------
 drivers/vhost/vhost.h            |  45 +-
 drivers/vhost/vringh.c           | 421 ++++++++++++++++++-
 drivers/vhost/vsock.c            |   2 +-
 drivers/virtio/Kconfig           |  13 +
 drivers/virtio/Makefile          |   1 +
 drivers/virtio/virtio_vdpa.c     | 396 ++++++++++++++++++
 include/linux/vdpa.h             | 253 +++++++++++
 include/linux/vhost_iotlb.h      |  47 +++
 include/linux/vringh.h           |  36 ++
 include/uapi/linux/vhost.h       |  24 ++
 include/uapi/linux/vhost_types.h |   8 +
 include/uapi/linux/virtio_net.h  | 102 ++++-
 tools/virtio/Makefile            |  27 +-
 41 files changed, 4310 insertions(+), 251 deletions(-)
 create mode 100644 drivers/vdpa/Kconfig
 create mode 100644 drivers/vdpa/Makefile
 create mode 100644 drivers/vdpa/ifcvf/Makefile
 create mode 100644 drivers/vdpa/ifcvf/ifcvf_base.c
 create mode 100644 drivers/vdpa/ifcvf/ifcvf_base.h
 create mode 100644 drivers/vdpa/ifcvf/ifcvf_main.c
 create mode 100644 drivers/vdpa/vdpa.c
 create mode 100644 drivers/vdpa/vdpa_sim/Makefile
 create mode 100644 drivers/vdpa/vdpa_sim/vdpa_sim.c
 delete mode 100644 drivers/vhost/Kconfig.vringh
 create mode 100644 drivers/vhost/iotlb.c
 create mode 100644 drivers/vhost/vdpa.c
 create mode 100644 drivers/virtio/virtio_vdpa.c
 create mode 100644 include/linux/vdpa.h
 create mode 100644 include/linux/vhost_iotlb.h

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
