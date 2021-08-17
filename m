Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 602BC3EE454
	for <lists.virtualization@lfdr.de>; Tue, 17 Aug 2021 04:24:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C68B04014A;
	Tue, 17 Aug 2021 02:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDkmejpSNOin; Tue, 17 Aug 2021 02:23:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5B81F400BF;
	Tue, 17 Aug 2021 02:23:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C949C000E;
	Tue, 17 Aug 2021 02:23:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CF3CC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 02:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9944383705
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 02:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cN5Q_ESomQ3X
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 02:23:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3C5880FE8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 02:23:51 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UjHGpao_1629167027; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UjHGpao_1629167027) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 17 Aug 2021 10:23:48 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [virtiofsd PATCH v4 1/4] virtiofsd: add .ioctl() support
Date: Tue, 17 Aug 2021 10:23:44 +0800
Message-Id: <20210817022347.18098-2-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210817022347.18098-1-jefflexu@linux.alibaba.com>
References: <20210817022220.17574-1-jefflexu@linux.alibaba.com>
 <20210817022347.18098-1-jefflexu@linux.alibaba.com>
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

Add .ioctl() support for passthrough, in prep for the following support
for following per-file DAX feature.

Once advertising support for per-file DAX feature, virtiofsd should
support storing FS_DAX_FL flag persistently passed by
FS_IOC_SETFLAGS/FS_IOC_FSSETXATTR ioctl, and set FUSE_ATTR_DAX in
FUSE_LOOKUP accordingly if the file is capable of per-file DAX.

When it comes to passthrough, it passes corresponding ioctls to host
directly. Currently only these ioctls that are needed for per-file DAX
feature, i.e., FS_IOC_GETFLAGS/FS_IOC_SETFLAGS and
FS_IOC_FSGETXATTR/FS_IOC_FSSETXATTR are supported. Later we can restrict
the flags/attributes allowed to be set to reinforce the security, or
extend the scope of allowed ioctls if it is really needed later.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 tools/virtiofsd/passthrough_ll.c      | 53 +++++++++++++++++++++++++++
 tools/virtiofsd/passthrough_seccomp.c |  1 +
 2 files changed, 54 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index b76d878509..e170b17adb 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -54,6 +54,7 @@
 #include <sys/wait.h>
 #include <sys/xattr.h>
 #include <syslog.h>
+#include <linux/fs.h>
 
 #include "qemu/cutils.h"
 #include "passthrough_helpers.h"
@@ -2105,6 +2106,57 @@ out:
     fuse_reply_err(req, saverr);
 }
 
+static void lo_ioctl(fuse_req_t req, fuse_ino_t ino, unsigned int cmd, void *arg,
+                  struct fuse_file_info *fi, unsigned flags, const void *in_buf,
+                  size_t in_bufsz, size_t out_bufsz)
+{
+    int fd = lo_fi_fd(req, fi);
+    int res;
+    int saverr = ENOSYS;
+
+    fuse_log(FUSE_LOG_DEBUG, "lo_ioctl(ino=%" PRIu64 ", cmd=0x%x, flags=0x%x, "
+	     "in_bufsz = %lu, out_bufsz = %lu)\n",
+	     ino, cmd, flags, in_bufsz, out_bufsz);
+
+    /* unrestricted ioctl is not supported yet */
+    if (flags & FUSE_IOCTL_UNRESTRICTED)
+        goto out;
+
+    /*
+     * Currently only those ioctls needed to support per-file DAX feature,
+     * i.e., FS_IOC_GETFLAGS/FS_IOC_SETFLAGS and
+     * FS_IOC_FSGETXATTR/FS_IOC_FSSETXATTR are supported.
+     */
+    if (cmd == FS_IOC_SETFLAGS || cmd == FS_IOC_FSSETXATTR) {
+        res = ioctl(fd, cmd, in_buf);
+        if (res < 0)
+            goto out_err;
+
+	fuse_reply_ioctl(req, 0, NULL, 0);
+    }
+    else if (cmd == FS_IOC_GETFLAGS || cmd == FS_IOC_FSGETXATTR) {
+	/* reused for 'unsigned int' for FS_IOC_GETFLAGS */
+	struct fsxattr attr;
+
+        res = ioctl(fd, cmd, &attr);
+        if (res < 0)
+            goto out_err;
+
+        fuse_reply_ioctl(req, 0, &attr, out_bufsz);
+    }
+    else {
+	fuse_log(FUSE_LOG_DEBUG, "Unsupported ioctl 0x%x\n", cmd);
+	goto out;
+    }
+
+    return;
+
+out_err:
+	saverr = errno;
+out:
+	fuse_reply_err(req, saverr);
+}
+
 static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
                         struct fuse_file_info *fi)
 {
@@ -3279,6 +3331,7 @@ static struct fuse_lowlevel_ops lo_oper = {
     .create = lo_create,
     .getlk = lo_getlk,
     .setlk = lo_setlk,
+    .ioctl = lo_ioctl,
     .open = lo_open,
     .release = lo_release,
     .flush = lo_flush,
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index 62441cfcdb..2a5f7614fc 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -62,6 +62,7 @@ static const int syscall_allowlist[] = {
     SCMP_SYS(gettid),
     SCMP_SYS(gettimeofday),
     SCMP_SYS(getxattr),
+    SCMP_SYS(ioctl),
     SCMP_SYS(linkat),
     SCMP_SYS(listxattr),
     SCMP_SYS(lseek),
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
