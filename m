Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6976211BE2A
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 21:45:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 170E586969;
	Wed, 11 Dec 2019 20:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwYGVQOVczod; Wed, 11 Dec 2019 20:45:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F6E686A2B;
	Wed, 11 Dec 2019 20:45:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0415DC0881;
	Wed, 11 Dec 2019 20:45:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 827DEC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 711A886969
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGmCW-GjJwRv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:45:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A966F85F5D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 20:45:38 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MF35K-1iUAUW2lIm-00FVsT; Wed, 11 Dec 2019 21:43:48 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Jens Axboe <axboe@kernel.dk>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 00/24] block, scsi: final compat_ioctl cleanup
Date: Wed, 11 Dec 2019 21:42:34 +0100
Message-Id: <20191211204306.1207817-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:tZdBk04hRhASKvxNK9GoShdQF2eDzAxPp3Cg+nGJZHfdv+pgn9O
 kwmXMRprVfQ0pim31l7qW7s2PAdADCj/awdh7RjgyY/fpM05v6Q4FPoPxGv7M/voa/433hE
 iMtmqCgX/c3+k4mAysDUXpBN3iwaTARXVJkOprXX/vYPQFVr07NqenTLneDPM6daZwlm0hy
 0YX0ky3/WBqCzIZatfYnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a4B9TvEXteU=:6Cc91AD+KrupUd8aoLdxST
 pLfWD4GRVX78zFLH10jxyBk47NToOUHPMzZ76AUs4LjwJIXCgzQ8lswxiYHO149apHXiNngIl
 vL6/HJ1QNL3gHBiZC6xbd/blGxhvEYzR/6K861xG028YhtTZyjkgvzNI4s+ZxjZQY3dBZXdtj
 UdsvdU9++f/akx191P/dx25X1cmHruMzPZ01VXH8m97YsuLMWM+B8G5ivaA4v8fCixGGXLAMr
 Clon04TCHz/QZelKq5De+Y09hFfQZgKM59HeSRuO4E8YOnKSt5nLG3kilomFqHSACrCSSUjNR
 5tt2Vr5wZDgiCBh6PCcBH9RXJWu24f2jptleN0EgRsm4faACe0x+A3CkdVquadMyd+E7vcK0F
 105IejPyxALlM8fACy6sEuAcTCVpa1DNJgOnvrswp8DOGcGj4NQZgnygKvVkbF+ctQC1kuH0L
 CVdoCkBlR77nIRW086rlN5fqFeDgoOz++WPC+Z4RCiMRqNzSjTG5SNIwoPEJPB3xGl1JU4v8V
 Jt4bKd6rB7CDuqggZ9Lsevm9gESw8V6Z6QaEmmL1k9s0p2g2y6fY67sAaVS1tSdXC4RZhAWZp
 5w4jEC/3SXNjtkR/AxiNrVjmpWvyUvgOV5XWSwU6IfzHdLcduFtRVwtpupm4YQYPDtyP/X3GU
 ofUZ0OsCJl1LWPytMLCf41zavpNOa86cXoxxvpFBVy98fkEnxsUymIsSb4p637NQQcFmz5Y1G
 m0RHQzeIuHR+dythmrWwFtBfI1/olCBtw3mimdzdploPhmuM8DjlS8eyzmuooX0ApryMh/GNn
 XsTJ05wjvOw24IeAQNMPLG2EGrP55tZFrElwpprXZDRQVPzCOL1+o/9scTvPzLZqh6Bi59Iy3
 t9uhoj8CKsmpUlIUsX+FRJzTifWm/uGhMxGlgIorYAUlSm90Ef5Z5WRQiZoQZ+6MedLbr5hqH
 WXA8oae97alSp0RHkhZOcO6ctORW1LVM=
Cc: justin@coraid.com, mst@redhat.com, catalin.marinas@arm.com,
 Kai.Makisara@kolumbus.fi, linux-ide@vger.kernel.org,
 artur.paszkiewicz@intel.com, will@kernel.org, tim@cyberelk.net,
 anton.ivanov@cambridgegreys.com, hare@suse.com, sstabellini@kernel.org,
 linux-scsi@vger.kernel.org, corbet@lwn.net, y2038@lists.linaro.org,
 richard@nod.at, linux-doc@vger.kernel.org, dgilbert@interlog.com,
 xen-devel@lists.xenproject.org, jinpu.wang@cloud.ionos.com,
 intel-linux-scu@intel.com, Arnd Bergmann <arnd@arndb.de>,
 konrad.wilk@oracle.com, jdike@addtoit.com, john.garry@huawei.com,
 linux-um@lists.infradead.org, efremov@linux.com, linux-block@vger.kernel.org,
 brking@us.ibm.com, bp@alien8.de, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, jgross@suse.com,
 linux-kernel@vger.kernel.org, fujita.tomonori@lab.ntt.co.jp,
 damien.lemoal@hgst.com, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
 davem@davemloft.net, roger.pau@citrix.com
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

Hi Jens, James and Martin,

This series concludes the work I did for linux-5.5 on the compat_ioctl()
cleanup, killing off fs/compat_ioctl.c and block/compat_ioctl.c by moving
everything into drivers.

Overall this would be a reduction both in complexity and line count, but
as I'm also adding documentation the overall number of lines increases
in the end.

My plan was originally to keep the SCSI and block parts separate.
This did not work easily because of interdependencies: I cannot
do the final SCSI cleanup in a good way without first addressing the
CDROM ioctls, so this is one series that I hope could be merged through
either the block or the scsi git trees, or possibly both if you can
pull in the same branch.

The series comes in these steps:

1. clean up the sg v3 interface as suggested by Linus. I have
   talked about this with Doug Gilbert as well, and he would
   rebase his sg v4 patches on top of "compat: scsi: sg: fix v3
   compat read/write interface"

2. Four patches for missing block compat_ioctl handlers, to be
   backported into stable kernels. Separate patches because they
   are needed in different stable versions.

3. Actually moving handlers out of block/compat_ioctl.c and
   block/scsi_ioctl.c into drivers, mixed in with cleanup
   patches

4. Document how to do this right. I keep getting asked about this,
   and it helps to point to some documentation file.

The series is avaialable for testing at [1].

       Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=compat-ioctl-endgame

Arnd Bergmann (24):
  compat: ARM64: always include asm-generic/compat.h
  compat: scsi: sg: fix v3 compat read/write interface
  compat_ioctl: block: handle BLKREPORTZONE/BLKRESETZONE
  compat_ioctl: block: handle BLKGETZONESZ/BLKGETNRZONES
  compat_ioctl: block: handle add zone open, close and finish ioctl
  compat_ioctl: block: handle Persistent Reservations
  compaT_ioctl: ubd, aoe: use blkdev_compat_ptr_ioctl
  compat_ioctl: move CDROM_SEND_PACKET handling into scsi
  compat_ioctl: move CDROMREADADIO to cdrom.c
  compat_ioctl: cdrom: handle CDROM_LAST_WRITTEN
  compat_ioctl: block: handle cdrom compat ioctl in non-cdrom drivers
  compat_ioctl: add scsi_compat_ioctl
  compat_ioctl: bsg: add handler
  compat_ioctl: ide: floppy: add handler
  compat_ioctl: scsi: move ioctl handling into drivers
  compat_ioctl: move sys_compat_ioctl() to ioctl.c
  compat_ioctl: simplify the implementation
  compat_ioctl: move cdrom commands into cdrom.c
  compat_ioctl: scsi: handle HDIO commands from drivers
  compat_ioctl: move HDIO ioctl handling into drivers/ide
  compat_ioctl: block: move blkdev_compat_ioctl() into ioctl.c
  compat_ioctl: block: simplify compat_blkpg_ioctl()
  compat_ioctl: simplify up block/ioctl.c
  Documentation: document ioctl interfaces better

 Documentation/core-api/index.rst       |   1 +
 Documentation/core-api/ioctl.rst       | 250 +++++++++++++++
 arch/arm64/include/asm/compat.h        |   5 +-
 arch/um/drivers/ubd_kern.c             |   1 +
 block/Makefile                         |   1 -
 block/bsg.c                            |   1 +
 block/compat_ioctl.c                   | 411 -------------------------
 block/ioctl.c                          | 319 +++++++++++++++----
 block/scsi_ioctl.c                     | 214 ++++++++-----
 drivers/ata/libata-scsi.c              |   9 +
 drivers/block/aoe/aoeblk.c             |   1 +
 drivers/block/floppy.c                 |   3 +
 drivers/block/paride/pcd.c             |   3 +
 drivers/block/paride/pd.c              |   1 +
 drivers/block/paride/pf.c              |   1 +
 drivers/block/pktcdvd.c                |  26 +-
 drivers/block/sunvdc.c                 |   1 +
 drivers/block/virtio_blk.c             |   3 +
 drivers/block/xen-blkfront.c           |   1 +
 drivers/cdrom/cdrom.c                  |  35 ++-
 drivers/cdrom/gdrom.c                  |   3 +
 drivers/ide/ide-cd.c                   |  40 +++
 drivers/ide/ide-disk.c                 |   3 +
 drivers/ide/ide-floppy.c               |   4 +
 drivers/ide/ide-floppy.h               |   2 +
 drivers/ide/ide-floppy_ioctl.c         |  35 +++
 drivers/ide/ide-gd.c                   |  14 +
 drivers/ide/ide-ioctls.c               |  47 ++-
 drivers/ide/ide-tape.c                 |  14 +
 drivers/scsi/aic94xx/aic94xx_init.c    |   3 +
 drivers/scsi/ch.c                      |   9 +-
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c |   3 +
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c |   3 +
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c |   3 +
 drivers/scsi/ipr.c                     |   3 +
 drivers/scsi/isci/init.c               |   3 +
 drivers/scsi/mvsas/mv_init.c           |   3 +
 drivers/scsi/pm8001/pm8001_init.c      |   3 +
 drivers/scsi/scsi_ioctl.c              |  54 +++-
 drivers/scsi/sd.c                      |  50 ++-
 drivers/scsi/sg.c                      | 169 +++++-----
 drivers/scsi/sr.c                      |  53 +++-
 drivers/scsi/st.c                      |  51 +--
 fs/Makefile                            |   2 +-
 fs/compat_ioctl.c                      | 261 ----------------
 fs/internal.h                          |   6 -
 fs/ioctl.c                             | 131 +++++---
 include/linux/blkdev.h                 |   7 +
 include/linux/falloc.h                 |   2 -
 include/linux/fs.h                     |   4 -
 include/linux/ide.h                    |   2 +
 include/linux/libata.h                 |   6 +
 include/scsi/scsi_ioctl.h              |   1 +
 include/scsi/sg.h                      |  30 ++
 54 files changed, 1249 insertions(+), 1062 deletions(-)
 create mode 100644 Documentation/core-api/ioctl.rst
 delete mode 100644 block/compat_ioctl.c
 delete mode 100644 fs/compat_ioctl.c

-- 
2.20.0

Cc: corbet@lwn.net
Cc: catalin.marinas@arm.com
Cc: will@kernel.org
Cc: jdike@addtoit.com
Cc: richard@nod.at
Cc: anton.ivanov@cambridgegreys.com
Cc: fujita.tomonori@lab.ntt.co.jp
Cc: justin@coraid.com
Cc: efremov@linux.com
Cc: tim@cyberelk.net
Cc: mst@redhat.com
Cc: jasowang@redhat.com
Cc: pbonzini@redhat.com
Cc: stefanha@redhat.com
Cc: boris.ostrovsky@oracle.com
Cc: jgross@suse.com
Cc: sstabellini@kernel.org
Cc: konrad.wilk@oracle.com
Cc: roger.pau@citrix.com
Cc: bp@alien8.de
Cc: davem@davemloft.net
Cc: john.garry@huawei.com
Cc: brking@us.ibm.com
Cc: intel-linux-scu@intel.com
Cc: artur.paszkiewicz@intel.com
Cc: jinpu.wang@cloud.ionos.com
Cc: dgilbert@interlog.com
Cc: Kai.Makisara@kolumbus.fi
Cc: arnd@arndb.de
Cc: damien.lemoal@hgst.com
Cc: hare@suse.com
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-um@lists.infradead.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-ide@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-fsdevel@vger.kernel.org
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
