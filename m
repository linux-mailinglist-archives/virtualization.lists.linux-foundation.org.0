Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BA1A0A73
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 11:50:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 17D23204AF;
	Tue,  7 Apr 2020 09:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKyAKHQ5xVAJ; Tue,  7 Apr 2020 09:50:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0296320489;
	Tue,  7 Apr 2020 09:50:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5DDFC0177;
	Tue,  7 Apr 2020 09:50:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BA69C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 09:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5D36787E7B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 09:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id af-y1Mdsm9sC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 09:50:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7EBA687E6E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586253040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0sVBPEE0xzucWIbbsT162YE9B5hG9SIrPw6ALlMaDJs=;
 b=YpMeAIjWHHfk0cA0K6FzC3QW5OxLn8UMVnOUC7kviT1wDCOvIbePTaNOz2e+r7U0JWuOdB
 2qumAjnYpOjN8agtsCEdWmyiUzVnuvBK6TZmVF+nqcZGmczOIR8QPpeRQtYS2GryBMC8uc
 bbooeIO2hzegv5JurGMdTk1jK9x3NS4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-ArmYf_1bNQ2ifjqs9EKu2w-1; Tue, 07 Apr 2020 05:50:37 -0400
X-MC-Unique: ArmYf_1bNQ2ifjqs9EKu2w-1
Received: by mail-wr1-f70.google.com with SMTP id d1so1472749wru.15
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Apr 2020 02:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0sVBPEE0xzucWIbbsT162YE9B5hG9SIrPw6ALlMaDJs=;
 b=DIJ4yA4vhp7ZeExEvDjyG4PPMpva8st7dedB1PkRUbD8SefBjIH78/R6sSd0V0cGCd
 UxJ2muyzeu0GiEgRty2RnDymp7w+pqVCzCR92gE1nIDRpVztiCqvSzBSb7W4cdzA6u/d
 kq30ZAo3TmLlKNCbnvpEcy+J+9wryt/hb3+CJvF8kAGuv5rashHz8dG6lWPpsgZU4Xgt
 i1TOVXYpcm1/CYC8eRI97QueuzTFrWpu0U2y5hW6s5HlBbRH6ERRpXUC/KOxbXNEC557
 kKHl7OyDUcyd2gnjHiLTCe+fVmn24xSqOrQbrWOaOFKofjxyDeQ3adSQP7DDoaeQd1F1
 ZHqg==
X-Gm-Message-State: AGi0PuZWBjgpUg2MKv/uEZFhKGKqEsnvdMCsUYz6MQdxdfGyi+mLb1fV
 TGwkpEuxSr294uqpBmE/72MgT0dv4tPkltWStcnJONotaYV/bN200E6c/Cg2PjmjzkvtWGYe5Fc
 bNZNd1WXkseyay/FAuiTIOU6fkwMtptFDQBJsNNUU1Q==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr1431082wmc.125.1586253035881; 
 Tue, 07 Apr 2020 02:50:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypJfdSbEhEAnnavsksjAg2GryZUBfh45QLjmuphCxXIBX+5BhJi3IGriZs1rxxuFBrWFBIg72Q==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr1431058wmc.125.1586253035663; 
 Tue, 07 Apr 2020 02:50:35 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id y15sm6107385wro.68.2020.04.07.02.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 02:50:35 -0700 (PDT)
Date: Tue, 7 Apr 2020 05:50:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] vhost: fixes, vdpa
Message-ID: <20200407054752-mutt-send-email-mst@kernel.org>
References: <20200406171124-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200406171124-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tiwei.bie@intel.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
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

On Mon, Apr 06, 2020 at 05:11:28PM -0400, Michael S. Tsirkin wrote:
> Now that many more architectures build vhost, a couple of these (um, and
> arm with deprecated oabi) have reported build failures with randconfig,
> however fixes for that need a bit more discussion/testing and will be
> merged separately.
> 
> Not a regression - these previously simply didn't have vhost at all.
> Also, there's some DMA API code in the vdpa simulator is hacky - if no
> solution surfaces soon we can always disable it before release:
> it's not a big deal either way as it's just test code.
> 
> The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:
> 
>   Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
> 
> for you to fetch changes up to c9b9f5f8c0f3cdb893cb86c168cdaa3aa5ed7278:
> 
>   vdpa: move to drivers/vdpa (2020-04-02 10:41:40 -0400)
> 
> ----------------------------------------------------------------
> virtio: fixes, vdpa
> 
> Some bug fixes.
> Balloon reverted to use the OOM handler again.
> The new vdpa subsystem with two first drivers.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

OK this was conflicting with akpm tree, turns out Stephen
was reverting the OOM handler change since akpm tree has its own
variant.

So I pushed the revert in my tree to make it easier for you.
I'll send PULL v2 just to make things clear.


> ----------------------------------------------------------------
> David Hildenbrand (1):
>       virtio-balloon: Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM
> 
> Jason Wang (7):
>       vhost: refine vhost and vringh kconfig
>       vhost: allow per device message handler
>       vhost: factor out IOTLB
>       vringh: IOTLB support
>       vDPA: introduce vDPA bus
>       virtio: introduce a vDPA based transport
>       vdpasim: vDPA device simulator
> 
> Michael S. Tsirkin (2):
>       tools/virtio: option to build an out of tree module
>       vdpa: move to drivers/vdpa
> 
> Tiwei Bie (1):
>       vhost: introduce vDPA-based backend
> 
> Yuri Benditovich (3):
>       virtio-net: Introduce extended RSC feature
>       virtio-net: Introduce RSS receive steering feature
>       virtio-net: Introduce hash report feature
> 
> Zhu Lingshan (1):
>       virtio: Intel IFC VF driver for VDPA
> 
>  MAINTAINERS                      |   3 +
>  arch/arm/kvm/Kconfig             |   2 -
>  arch/arm64/kvm/Kconfig           |   2 -
>  arch/mips/kvm/Kconfig            |   2 -
>  arch/powerpc/kvm/Kconfig         |   2 -
>  arch/s390/kvm/Kconfig            |   4 -
>  arch/x86/kvm/Kconfig             |   4 -
>  drivers/Kconfig                  |   4 +
>  drivers/Makefile                 |   1 +
>  drivers/misc/mic/Kconfig         |   4 -
>  drivers/net/caif/Kconfig         |   4 -
>  drivers/vdpa/Kconfig             |  37 ++
>  drivers/vdpa/Makefile            |   4 +
>  drivers/vdpa/ifcvf/Makefile      |   3 +
>  drivers/vdpa/ifcvf/ifcvf_base.c  | 389 +++++++++++++++++
>  drivers/vdpa/ifcvf/ifcvf_base.h  | 118 ++++++
>  drivers/vdpa/ifcvf/ifcvf_main.c  | 435 +++++++++++++++++++
>  drivers/vdpa/vdpa.c              | 180 ++++++++
>  drivers/vdpa/vdpa_sim/Makefile   |   2 +
>  drivers/vdpa/vdpa_sim/vdpa_sim.c | 629 ++++++++++++++++++++++++++++
>  drivers/vhost/Kconfig            |  45 +-
>  drivers/vhost/Kconfig.vringh     |   6 -
>  drivers/vhost/Makefile           |   6 +
>  drivers/vhost/iotlb.c            | 177 ++++++++
>  drivers/vhost/net.c              |   5 +-
>  drivers/vhost/scsi.c             |   2 +-
>  drivers/vhost/vdpa.c             | 883 +++++++++++++++++++++++++++++++++++++++
>  drivers/vhost/vhost.c            | 233 ++++-------
>  drivers/vhost/vhost.h            |  45 +-
>  drivers/vhost/vringh.c           | 421 ++++++++++++++++++-
>  drivers/vhost/vsock.c            |   2 +-
>  drivers/virtio/Kconfig           |  13 +
>  drivers/virtio/Makefile          |   1 +
>  drivers/virtio/virtio_balloon.c  | 107 ++---
>  drivers/virtio/virtio_vdpa.c     | 396 ++++++++++++++++++
>  include/linux/vdpa.h             | 253 +++++++++++
>  include/linux/vhost_iotlb.h      |  47 +++
>  include/linux/vringh.h           |  36 ++
>  include/uapi/linux/vhost.h       |  24 ++
>  include/uapi/linux/vhost_types.h |   8 +
>  include/uapi/linux/virtio_net.h  | 102 ++++-
>  tools/virtio/Makefile            |  27 +-
>  42 files changed, 4354 insertions(+), 314 deletions(-)
>  create mode 100644 drivers/vdpa/Kconfig
>  create mode 100644 drivers/vdpa/Makefile
>  create mode 100644 drivers/vdpa/ifcvf/Makefile
>  create mode 100644 drivers/vdpa/ifcvf/ifcvf_base.c
>  create mode 100644 drivers/vdpa/ifcvf/ifcvf_base.h
>  create mode 100644 drivers/vdpa/ifcvf/ifcvf_main.c
>  create mode 100644 drivers/vdpa/vdpa.c
>  create mode 100644 drivers/vdpa/vdpa_sim/Makefile
>  create mode 100644 drivers/vdpa/vdpa_sim/vdpa_sim.c
>  delete mode 100644 drivers/vhost/Kconfig.vringh
>  create mode 100644 drivers/vhost/iotlb.c
>  create mode 100644 drivers/vhost/vdpa.c
>  create mode 100644 drivers/virtio/virtio_vdpa.c
>  create mode 100644 include/linux/vdpa.h
>  create mode 100644 include/linux/vhost_iotlb.h

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
