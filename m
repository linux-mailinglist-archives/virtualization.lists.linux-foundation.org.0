Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CA1F4C7D
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 06:45:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17C048815F;
	Wed, 10 Jun 2020 04:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTfuwAU+Lbye; Wed, 10 Jun 2020 04:45:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 820E888213;
	Wed, 10 Jun 2020 04:45:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E558C016F;
	Wed, 10 Jun 2020 04:45:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB40BC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9E345889EC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-vRKy9nrHYI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:45:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B3A47889E8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591764310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=VxmhQ3VVJqCwy8aaYD5pSLwJjZ0VIqyd7EjfATRpmNc=;
 b=N4FQ1E4sY/97yjIcbn4mLhxfA7ua4XGg5sJe0dsnbOY5hDWjjOZIgJKYMAwTE8eixYdi5M
 k+AvEgkbmWe2k1YeKhzKGX3KBy6u9DG+E0gFabINgfNxUjxGtz0EtCAuGPEm70rjcjKng2
 BYoUPqTiJTHLeliUlIelw+e59ewuHRA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-fiHGmMiSONuBxRv2SENhXQ-1; Wed, 10 Jun 2020 00:45:06 -0400
X-MC-Unique: fiHGmMiSONuBxRv2SENhXQ-1
Received: by mail-wr1-f71.google.com with SMTP id l18so537576wrm.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Jun 2020 21:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=VxmhQ3VVJqCwy8aaYD5pSLwJjZ0VIqyd7EjfATRpmNc=;
 b=qTzndbNGkIJbz1BkX9geE3rdiIahG1J0tOnpjvy963J3VigUjJKbblg27V05WacClh
 eLq/xF+k/tMjUzO+5izfXCw7N5angybJ+EMUn5FnC6fxIAYLn+dolWZ9q+3MbNnoXyXS
 aIPKcHMApd2mgWZs9OdxF7vzAq+/b2LIcIRAFf5kCRoVPfDjkgQatSLwrVG1F7lRJYaB
 ryNRCuA4RdDIGLbCSgYHjkQ0S17+pZ9oVP7CTk4uK35t8bXQO+Wu9PJGPSwiquOGiXO8
 NYTGcy99mrVIQIcMFhG7F+AsSwQaIpzsZqNGdkLxXDhEQivI+yDfp6yDg4nU3qgM5gma
 9ReQ==
X-Gm-Message-State: AOAM531blwEIHPF0Wu54YiefmISw7iswO7uk4tolx5MHKl6LRk2lt74q
 9ZGsVr61MA+Ex0A8TAj0/GYwpp0lnCktJE3Lz+110ydvoOQmYb9d09UfrGjH9GrLWUphcrIAskO
 AFiHSwrRylOpuGndb6atNNW4Nb/y1JnndaDiELVl+GQ==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr1496139wrt.56.1591764305587;
 Tue, 09 Jun 2020 21:45:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywRytP6FIoM+W4oWypswZZXFPjrrjECTCkbmv+pP0bloGWVKqtSdiGopJ/ccnY8HzNdJNBwg==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr1496086wrt.56.1591764305280;
 Tue, 09 Jun 2020 21:45:05 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id q128sm5199346wma.38.2020.06.09.21.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 21:45:04 -0700 (PDT)
Date: Wed, 10 Jun 2020 00:44:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] virtio: features, fixes
Message-ID: <20200610004455-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: osalvador@suse.com, mhocko@suse.com, kvm@vger.kernel.org,
 kernelfans@gmail.com, virtualization@lists.linux-foundation.org,
 glider@google.com, teawaterz@linux.alibaba.com,
 alexander.h.duyck@linux.intel.com, elfring@users.sourceforge.net,
 herbert@gondor.apana.org.au, zou_wei@huawei.com, linux-acpi@vger.kernel.org,
 konrad.wilk@oracle.com, rppt@linux.ibm.com, hulkci@huawei.com,
 richard.weiyang@gmail.com, clabbe@baylibre.com, anthony.yznaga@oracle.com,
 longpeng2@huawei.com, osalvador@suse.de, dyoung@redhat.com, lenb@kernel.org,
 pavel.tatashin@microsoft.com, pasha.tatashin@soleen.com,
 anshuman.khandual@arm.com, gregkh@linuxfoundation.org, cai@lca.pw,
 stefanha@redhat.com, dan.j.williams@intel.com, mhocko@kernel.org,
 lingshan.zhu@intel.com, vbabka@suse.cz, lkp@intel.com, jgross@suse.com,
 pankaj.gupta.linux@gmail.com, netdev@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, matej.genci@nutanix.com,
 mst@redhat.com, hannes@cmpxchg.org, rafael@kernel.org, imammedo@redhat.com,
 akpm@linux-foundation.org, mgorman@techsingularity.net, davem@davemloft.net
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

There's a single commit here that I tweaked since linux-next - the
change is in printk format string which I consider trivial enough not
force wait for more testing. A couple of hashes are different from
what's in linux-next though.  I also upgraded the machine I used to sign
the tag (didn't change the key) - hope the signature is still ok. If not
pls let me know!

The following changes since commit 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162:

  Linux 5.7 (2020-05-31 16:49:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 044e4b09223039e571e6ec540e25552054208765:

  vhost/test: fix up after API change (2020-06-09 06:42:06 -0400)

----------------------------------------------------------------
virtio: features, fixes

virtio-mem
doorbell mapping for vdpa
config interrupt support in ifc
fixes all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alexander Duyck (1):
      virtio-balloon: Disable free page reporting if page poison reporting is not enabled

David Hildenbrand (17):
      MAINTAINERS: Add myself as virtio-balloon co-maintainer
      virtio-mem: Paravirtualized memory hotplug
      MAINTAINERS: Add myself as virtio-mem maintainer
      virtio-mem: Allow to specify an ACPI PXM as nid
      virtio-mem: Paravirtualized memory hotunplug part 1
      virtio-mem: Paravirtualized memory hotunplug part 2
      mm: Allow to offline unmovable PageOffline() pages via MEM_GOING_OFFLINE
      virtio-mem: Allow to offline partially unplugged memory blocks
      mm/memory_hotplug: Introduce offline_and_remove_memory()
      virtio-mem: Offline and remove completely unplugged memory blocks
      virtio-mem: Better retry handling
      virtio-mem: Add parent resource for all added "System RAM"
      virtio-mem: Drop manual check for already present memory
      virtio-mem: Unplug subblocks right-to-left
      virtio-mem: Use -ETXTBSY as error code if the device is busy
      virtio-mem: Try to unplug the complete online memory block first
      virtio-mem: Don't rely on implicit compiler padding for requests

Guennadi Liakhovetski (1):
      vhost: (cosmetic) remove a superfluous variable initialisation

Jason Wang (4):
      vhost: allow device that does not depend on vhost worker
      vhost: use mmgrab() instead of mmget() for non worker device
      vdpa: introduce get_vq_notification method
      vhost_vdpa: support doorbell mapping via mmap

Longpeng(Mike) (3):
      crypto: virtio: Fix src/dst scatterlist calculation in __virtio_crypto_skcipher_do_req()
      crypto: virtio: Fix use-after-free in virtio_crypto_skcipher_finalize_req()
      crypto: virtio: Fix dest length calculation in __virtio_crypto_skcipher_do_req()

Markus Elfring (1):
      virtio-mmio: Delete an error message in vm_find_vqs()

Matej Genci (1):
      virtio: add VIRTIO_RING_NO_LEGACY

Michael S. Tsirkin (6):
      virtio: force spec specified alignment on types
      vhost: revert "vhost: disable for OABI"
      vhost_vdpa: disable doorbell mapping for !MMU
      virtio-mem: drop unnecessary initialization
      virtio_mem: convert device block size into 64bit
      vhost/test: fix up after API change

Samuel Zou (1):
      vdpasim: Fix some coccinelle warnings

Zhu Lingshan (5):
      ifcvf: move IRQ request/free to status change handlers
      ifcvf: ignore continuous setting same status value
      vhost_vdpa: Support config interrupt in vdpa
      vhost: replace -1 with VHOST_FILE_UNBIND in ioctls
      ifcvf: implement config interrupt in IFCVF

 MAINTAINERS                                |   18 +-
 drivers/acpi/numa/srat.c                   |    1 +
 drivers/crypto/virtio/virtio_crypto_algs.c |   21 +-
 drivers/misc/mic/Kconfig                   |    2 +-
 drivers/net/caif/Kconfig                   |    2 +-
 drivers/vdpa/Kconfig                       |    2 +-
 drivers/vdpa/ifcvf/ifcvf_base.c            |    3 +
 drivers/vdpa/ifcvf/ifcvf_base.h            |    4 +
 drivers/vdpa/ifcvf/ifcvf_main.c            |  146 ++-
 drivers/vdpa/vdpa_sim/vdpa_sim.c           |    7 +-
 drivers/vhost/Kconfig                      |   17 +-
 drivers/vhost/net.c                        |    2 +-
 drivers/vhost/scsi.c                       |    2 +-
 drivers/vhost/test.c                       |    2 +-
 drivers/vhost/vdpa.c                       |  112 +-
 drivers/vhost/vhost.c                      |  100 +-
 drivers/vhost/vhost.h                      |    8 +-
 drivers/vhost/vringh.c                     |    6 +-
 drivers/vhost/vsock.c                      |    2 +-
 drivers/virtio/Kconfig                     |   17 +
 drivers/virtio/Makefile                    |    1 +
 drivers/virtio/virtio_balloon.c            |    9 +-
 drivers/virtio/virtio_mem.c                | 1965 ++++++++++++++++++++++++++++
 drivers/virtio/virtio_mmio.c               |    4 +-
 drivers/virtio/virtio_pci_modern.c         |    1 +
 include/linux/memory_hotplug.h             |    1 +
 include/linux/page-flags.h                 |   10 +
 include/linux/vdpa.h                       |   16 +
 include/linux/vringh.h                     |    6 +-
 include/uapi/linux/vhost.h                 |    4 +
 include/uapi/linux/virtio_ids.h            |    1 +
 include/uapi/linux/virtio_mem.h            |  211 +++
 include/uapi/linux/virtio_ring.h           |   48 +-
 mm/memory_hotplug.c                        |   81 +-
 mm/page_alloc.c                            |   26 +
 mm/page_isolation.c                        |    9 +
 36 files changed, 2723 insertions(+), 144 deletions(-)
 create mode 100644 drivers/virtio/virtio_mem.c
 create mode 100644 include/uapi/linux/virtio_mem.h

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
