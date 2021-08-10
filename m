Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C483DFBCC
	for <lists.virtualization@lfdr.de>; Wed,  4 Aug 2021 09:07:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0842E40669;
	Wed,  4 Aug 2021 07:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghUTh-gS70ee; Wed,  4 Aug 2021 07:07:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC5BA4066F;
	Wed,  4 Aug 2021 07:07:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A229C000E;
	Wed,  4 Aug 2021 07:07:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1670FC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 07:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F27B74025C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 07:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vSeXdPdhF4l
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 07:07:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C0B340282
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 07:07:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Uhx4ykY_1628060813; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0Uhx4ykY_1628060813) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 04 Aug 2021 15:06:53 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [PATCH v3 0/8] fuse,virtiofs: support per-file DAX
Date: Wed,  4 Aug 2021 15:06:45 +0800
Message-Id: <20210804070653.118123-1-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, virtio-fs@redhat.com,
 bo.liu@linux.alibaba.com, joseph.qi@linux.alibaba.com,
 virtualization@lists.linux-foundation.org
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

changes since v2:
- modify fuse_show_options() accordingly to make it compatible with
  new tri-state mount option (patch 2)
- extract FUSE protocol changes into one seperate patch (patch 3)
- FUSE server/client need to negotiate if they support per-file DAX
  (patch 4)
- extract DONT_CACHE logic into patch 6/7


This patchset adds support of per-file DAX for virtiofs, which is
inspired by Ira Weiny's work on ext4[1] and xfs[2].

Any comment is welcome.

[1] commit 9cb20f94afcd ("fs/ext4: Make DAX mount option a tri-state")
[2] commit 02beb2686ff9 ("fs/xfs: Make DAX mount option a tri-state")

v2: https://www.spinics.net/lists/linux-fsdevel/msg199584.html
v1: https://www.spinics.net/lists/linux-virtualization/msg51008.html

Jeffle Xu (8):
  fuse: add fuse_should_enable_dax() helper
  fuse: Make DAX mount option a tri-state
  fuse: support per-file DAX
  fuse: negotiate if server/client supports per-file DAX
  fuse: enable per-file DAX
  fuse: mark inode DONT_CACHE when per-file DAX indication changes
  fuse: support changing per-file DAX flag inside guest
  fuse: show '-o dax=inode' option only when FUSE server supports

 fs/fuse/dax.c             | 32 ++++++++++++++++++++++++++++++--
 fs/fuse/file.c            |  4 ++--
 fs/fuse/fuse_i.h          | 22 ++++++++++++++++++----
 fs/fuse/inode.c           | 27 ++++++++++++++++++---------
 fs/fuse/ioctl.c           | 15 +++++++++++++--
 fs/fuse/virtio_fs.c       | 16 ++++++++++++++--
 include/uapi/linux/fuse.h |  9 ++++++++-
 7 files changed, 103 insertions(+), 22 deletions(-)

-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
