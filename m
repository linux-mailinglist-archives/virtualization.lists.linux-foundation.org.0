Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 069F019FFFB
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:11:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87E8987748;
	Mon,  6 Apr 2020 21:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3xMT-XxcNtj; Mon,  6 Apr 2020 21:11:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A8F69852C7;
	Mon,  6 Apr 2020 21:11:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D096C0177;
	Mon,  6 Apr 2020 21:11:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94741C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7F05C86472
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhGbigoBlOdr
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:11:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E098985BDF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586207504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=xw2IXbDc6erg5HETD8kiXgNsbIOvz2N8DW0E+Bc8mD0=;
 b=H6+5XnSVFzr9474GI4qOiQ9wSF9WziGfpRHuoYtEQFfe22c8wjO4SPtPlLZiG/v0T5o2e8
 w0sb0/aS0Uyy0/07HC5YRSUYuihgdK7CF2xtTlGkHDLBH1TD5TavybDZoYkyZBs0O5MzQv
 q+4vsbjxuuS8fu/b4K7jlSHupkadyHw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-c8Mfv4nMOO-U4WYbp7w5tQ-1; Mon, 06 Apr 2020 17:11:29 -0400
X-MC-Unique: c8Mfv4nMOO-U4WYbp7w5tQ-1
Received: by mail-wr1-f69.google.com with SMTP id 88so554994wrq.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=xw2IXbDc6erg5HETD8kiXgNsbIOvz2N8DW0E+Bc8mD0=;
 b=pe+CTkGTJSYEB5Z1jkfB4/r81c7c/xWf24RN59nd2eWXuBUQzlLTtjICUrEpz2T8lm
 wa8zKRdv/nLOiUsblm2Qj6AFGogiUmuj5xSgpE4q6gTLF8T6s9GXecQuC5YBso8K977s
 +5lnRs8Yq8pLjduF9JeTN0a2yY86pBR/RKtXxGzWd4pK1PFmJMAKstpKriKtL8Pw7UTI
 lLyxr9q8Tdx4bghr7GwRf2hEtiEcvhnx7nDN0zgGOJJqpZnNDKW1q3lAQ1qxQJkadeX0
 985oU7LCRiiso3xu/d1hRjHzRks8Y8lEeGVTFX0AeusWVa4BoPSvDaOTg5cSTM+eD6kJ
 5jyA==
X-Gm-Message-State: AGi0PuY1BV9c44GNuiqb7LOJyDG+n2NfAn3B59UIDbqonncUV5vwvqvc
 L8sA12InhaGnx5yZ2d7lbcPOkoNeD+zEV8UGNtWiayWnNWN7turkgZwxo4ufUV/LG8CrzTUfbPd
 zupKmnIugjt9XteMI+lMeWU5BGUqgjwqGQlAtEPJUYQ==
X-Received: by 2002:a05:600c:2a52:: with SMTP id
 x18mr932495wme.37.1586207488355; 
 Mon, 06 Apr 2020 14:11:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypIuopl4ajbdC3ug75t4KceTRePheaHXToSHTTSi41utVfsJr0uYqtKb8e7/TbxvYzk23Hg23w==
X-Received: by 2002:a05:600c:2a52:: with SMTP id
 x18mr932473wme.37.1586207488125; 
 Mon, 06 Apr 2020 14:11:28 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id d7sm27508603wrr.77.2020.04.06.14.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:11:27 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:11:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] vhost: fixes, vdpa
Message-ID: <20200406171124-mutt-send-email-mst@kernel.org>
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

for you to fetch changes up to c9b9f5f8c0f3cdb893cb86c168cdaa3aa5ed7278:

  vdpa: move to drivers/vdpa (2020-04-02 10:41:40 -0400)

----------------------------------------------------------------
virtio: fixes, vdpa

Some bug fixes.
Balloon reverted to use the OOM handler again.
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

Michael S. Tsirkin (2):
      tools/virtio: option to build an out of tree module
      vdpa: move to drivers/vdpa

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
 drivers/virtio/virtio_balloon.c  | 107 ++---
 drivers/virtio/virtio_vdpa.c     | 396 ++++++++++++++++++
 include/linux/vdpa.h             | 253 +++++++++++
 include/linux/vhost_iotlb.h      |  47 +++
 include/linux/vringh.h           |  36 ++
 include/uapi/linux/vhost.h       |  24 ++
 include/uapi/linux/vhost_types.h |   8 +
 include/uapi/linux/virtio_net.h  | 102 ++++-
 tools/virtio/Makefile            |  27 +-
 42 files changed, 4354 insertions(+), 314 deletions(-)
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
