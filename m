Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C563DFC0B
	for <lists.virtualization@lfdr.de>; Wed,  4 Aug 2021 09:24:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7E4C401B3;
	Wed,  4 Aug 2021 07:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJhO9bex4t9f; Wed,  4 Aug 2021 07:24:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0EB6B40198;
	Wed,  4 Aug 2021 07:24:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84D6FC001F;
	Wed,  4 Aug 2021 07:24:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F8C4C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 07:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 496026061C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 07:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfPAUM2k-UbQ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 07:24:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48E396058D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 07:24:14 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UhwmYqy_1628061851; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UhwmYqy_1628061851) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 04 Aug 2021 15:24:11 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [PATCH virtiofsd 0/3] virtiofsd: support per-file DAX
Date: Wed,  4 Aug 2021 15:24:08 +0800
Message-Id: <20210804072411.1180-1-jefflexu@linux.alibaba.com>
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

As discussed with Vivek Goyal, I tried to make virtiofsd support
per-file DAX by checking if the file is marked with FS_DAX_FL attr. Thus
I need to implement .ioctl() method for passthrough_ll.c (because
FS_DAX_FL attr is get/set by FS_IOC_GETFLAGS/FS_IOC_SETFLAGS ioctl),
something like

```
static struct fuse_lowlevel_ops lo_oper = {
+    .ioctl = lo_ioctl,

+static void lo_ioctl(...)
+{
+	ret = ioctl(fd, FS_IOC_SETFLAGS, ...);
}
```

But unfortunately once virtiofsd calls ioctl() syscall, it directly
exits, and qemu also hangs with 'qemu-system-x86_64: Unexpected
end-of-file before all data were read'. I'm not sure if it's because
ioctl() is not permitted at all for virtiofsd or qemu. Many thanks if
someone familiar with virtualization could help.

The code repository of virtiofsd used is:
gitlab.com/virtio-fs/qemu.git virtio-fs-dev

Thus this patch set is still used for test only, marking files larger
than 1MB shall enable per-file DAX.

Jeffle Xu (3):
  virtiofsd: expand fuse protocol to support per-file DAX
  virtiofsd: support per-file DAX negotiation in FUSE_INIT
  virtiofsd: support per-file DAX in FUSE_LOOKUP

 include/standard-headers/linux/fuse.h | 2 ++
 tools/virtiofsd/fuse_common.h         | 5 +++++
 tools/virtiofsd/fuse_lowlevel.c       | 6 ++++++
 tools/virtiofsd/passthrough_ll.c      | 6 ++++++
 4 files changed, 19 insertions(+)

-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
