Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EDF3CB65A
	for <lists.virtualization@lfdr.de>; Fri, 16 Jul 2021 12:48:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55C4F60D88;
	Fri, 16 Jul 2021 10:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tn4BGr1AE3O8; Fri, 16 Jul 2021 10:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 38F956F975;
	Fri, 16 Jul 2021 10:48:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23125C0029;
	Fri, 16 Jul 2021 10:48:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F37BC0010
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 10:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DC084014C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 10:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPEwbKZZepFh
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 10:47:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11DD640106
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 10:47:56 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R971e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0UfyVhOl_1626432473; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UfyVhOl_1626432473) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 16 Jul 2021 18:47:53 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [PATCH v2 0/4] virtiofs,fuse: support per-file DAX
Date: Fri, 16 Jul 2021 18:47:49 +0800
Message-Id: <20210716104753.74377-1-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 bo.liu@linux.alibaba.com, virtualization@lists.linux-foundation.org
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

This patchset adds support of per-file DAX for virtiofs, which is
inspired by Ira Weiny's work on ext4[1] and xfs[2].

There are three related scenarios:
1. Alloc inode: get per-file DAX flag from fuse_attr.flags. (patch 3)
2. Per-file DAX flag changes when the file has been opened. (patch 3)
In this case, the dentry and inode are all marked as DONT_CACHE, and
the DAX state won't be updated until the file is closed and reopened
later.
3. Users can change the per-file DAX flag inside the guest by chattr(1).
(patch 4)
4. Create new files under directories with DAX enabled. When creating
new files in ext4/xfs on host, the new created files will inherit the
per-file DAX flag from the directory, and thus the new created files in
virtiofs will also inherit the per-file DAX flag if the fuse server
derives fuse_attr.flags from the underlying ext4/xfs inode's per-file
DAX flag.


Any comment is welcome.

[1] commit 9cb20f94afcd ("fs/ext4: Make DAX mount option a tri-state")
[2] commit 02beb2686ff9 ("fs/xfs: Make DAX mount option a tri-state")


changes since v1:
- add support for changing per-file DAX flags inside guest (patch 4)

v1:https://www.spinics.net/lists/linux-virtualization/msg51008.html

Jeffle Xu (4):
  fuse: add fuse_should_enable_dax() helper
  fuse: Make DAX mount option a tri-state
  fuse: add per-file DAX flag
  fuse: support changing per-file DAX flag inside guest

 fs/fuse/dax.c             | 36 ++++++++++++++++++++++++++++++++++--
 fs/fuse/file.c            |  4 ++--
 fs/fuse/fuse_i.h          | 16 ++++++++++++----
 fs/fuse/inode.c           |  7 +++++--
 fs/fuse/ioctl.c           |  9 ++++++---
 fs/fuse/virtio_fs.c       | 16 ++++++++++++++--
 include/uapi/linux/fuse.h |  5 +++++
 7 files changed, 78 insertions(+), 15 deletions(-)

-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
