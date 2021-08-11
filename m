Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 515573E8AA4
	for <lists.virtualization@lfdr.de>; Wed, 11 Aug 2021 08:56:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF5F6832D1;
	Wed, 11 Aug 2021 06:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmLdk3Szb7Sn; Wed, 11 Aug 2021 06:56:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A92EB826FB;
	Wed, 11 Aug 2021 06:56:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AF5BC0022;
	Wed, 11 Aug 2021 06:56:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFA32C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 06:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B3D560847
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 06:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZkj7E-VHg6G
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 06:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B16A607CF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 06:56:25 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UifQe5k_1628664981; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UifQe5k_1628664981) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 11 Aug 2021 14:56:21 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [virtiofsd PATCH v2 0/4] virtiofsd: support per-file DAX
Date: Wed, 11 Aug 2021 14:56:17 +0800
Message-Id: <20210811065621.12737-1-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210804070653.118123-1-jefflexu@linux.alibaba.com>
References: <20210804070653.118123-1-jefflexu@linux.alibaba.com>
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

I mentioned in virtiofsd PATCH v1 that virtiofsd exits once ioctl() is
called. After depper investigation into this issue, I find that it is
because ioctl() is blocked out the whitelist of seccomp of virtiofsd.

To support ioctl, ioctl syscall shall be added into the whitelist (see patch
1).

And this is the complete workable version for virtiofsd:
- virtiofsd now supports FUSE_IOCTL now, though currently only
  FS_IOC_G[S]ETFLAGS/FS_IOC_FSG[S]ETXATTR are supported.
- During FUSE_INIT, virtiofsd advertise support for per-file DAX only
  when the backend fs is ext4/xfs.
- FS_IOC_SETFLAGS/FS_IOC_FSSETXATTR FUSE_IOCTL will be directed to host,
  so that FS_DAX_FL could be flushed to backed fs persistently.
- During FUSE_LOOKUP, virtiofsd will decide DAX shall be enabled for
  current file according to if this file is marked with FS_DAX_FL in the
  backend fs.


PS.
In the current implementation, the kernel always advertise
FUSE_PERFILE_DAX no matter whether it's mounted with '-o dax=inode' or
not. It can be fixed in the next version, and I need more feedbacks so far.

Any comment on this whole series is welcome.

Jeffle Xu (4):
  virtiofsd: add .ioctl() support
  virtiofsd: expand fuse protocol to support per-file DAX
  virtiofsd: support per-file DAX negotiation in FUSE_INIT
  virtiofsd: support per-file DAX in FUSE_LOOKUP

 include/standard-headers/linux/fuse.h |   2 +
 tools/virtiofsd/fuse_common.h         |   5 ++
 tools/virtiofsd/fuse_lowlevel.c       |   6 ++
 tools/virtiofsd/passthrough_ll.c      | 115 ++++++++++++++++++++++++++
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 5 files changed, 129 insertions(+)

-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
