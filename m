Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96E3CB659
	for <lists.virtualization@lfdr.de>; Fri, 16 Jul 2021 12:48:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 120F640EFF;
	Fri, 16 Jul 2021 10:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5G96Gl45Hw5; Fri, 16 Jul 2021 10:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BFF3D4015D;
	Fri, 16 Jul 2021 10:48:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9EB0C0025;
	Fri, 16 Jul 2021 10:48:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9409EC000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 10:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C13B60D5E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 10:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87M4EwWyH0hK
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 10:47:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8985D60AB2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 10:47:57 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0UfysPeG_1626432474; 
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UfysPeG_1626432474) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 16 Jul 2021 18:47:54 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com,
	stefanha@redhat.com,
	miklos@szeredi.hu
Subject: [PATCH v2 2/4] fuse: Make DAX mount option a tri-state
Date: Fri, 16 Jul 2021 18:47:51 +0800
Message-Id: <20210716104753.74377-3-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716104753.74377-1-jefflexu@linux.alibaba.com>
References: <20210716104753.74377-1-jefflexu@linux.alibaba.com>
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

We add 'always', 'never', and 'inode' (default). '-o dax' continues to
operate the same which is equivalent to 'always'.

By the time this patch is applied, 'inode' mode is actually equal to
'always' mode, before the per-file DAX flag is introduced in the
following patch.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/fuse/dax.c       | 13 ++++++++++++-
 fs/fuse/fuse_i.h    | 11 +++++++++--
 fs/fuse/inode.c     |  2 +-
 fs/fuse/virtio_fs.c | 16 ++++++++++++++--
 4 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index c6f4e82e65f3..a478e824c2d0 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -70,6 +70,9 @@ struct fuse_inode_dax {
 };
 
 struct fuse_conn_dax {
+	/** dax mode: FUSE_DAX_MOUNT_* (always, never or per-file) **/
+	unsigned int mode;
+
 	/* DAX device */
 	struct dax_device *dev;
 
@@ -1288,7 +1291,8 @@ static int fuse_dax_mem_range_init(struct fuse_conn_dax *fcd)
 	return ret;
 }
 
-int fuse_dax_conn_alloc(struct fuse_conn *fc, struct dax_device *dax_dev)
+int fuse_dax_conn_alloc(struct fuse_conn *fc, unsigned int mode,
+			struct dax_device *dax_dev)
 {
 	struct fuse_conn_dax *fcd;
 	int err;
@@ -1301,6 +1305,7 @@ int fuse_dax_conn_alloc(struct fuse_conn *fc, struct dax_device *dax_dev)
 		return -ENOMEM;
 
 	spin_lock_init(&fcd->lock);
+	fcd->mode = mode;
 	fcd->dev = dax_dev;
 	err = fuse_dax_mem_range_init(fcd);
 	if (err) {
@@ -1339,10 +1344,16 @@ static const struct address_space_operations fuse_dax_file_aops  = {
 static bool fuse_should_enable_dax(struct inode *inode)
 {
 	struct fuse_conn *fc = get_fuse_conn(inode);
+	unsigned int mode;
 
 	if (!fc->dax)
 		return false;
 
+	mode = fc->dax->mode;
+
+	if (mode == FUSE_DAX_MOUNT_NEVER)
+		return false;
+
 	return true;
 }
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 07829ce78695..f29018323845 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -487,6 +487,12 @@ struct fuse_dev {
 	struct list_head entry;
 };
 
+enum {
+	FUSE_DAX_MOUNT_INODE,
+	FUSE_DAX_MOUNT_ALWAYS,
+	FUSE_DAX_MOUNT_NEVER,
+};
+
 struct fuse_fs_context {
 	int fd;
 	unsigned int rootmode;
@@ -503,7 +509,7 @@ struct fuse_fs_context {
 	bool no_control:1;
 	bool no_force_umount:1;
 	bool legacy_opts_show:1;
-	bool dax:1;
+	unsigned int dax;
 	unsigned int max_read;
 	unsigned int blksize;
 	const char *subtype;
@@ -1242,7 +1248,8 @@ ssize_t fuse_dax_read_iter(struct kiocb *iocb, struct iov_iter *to);
 ssize_t fuse_dax_write_iter(struct kiocb *iocb, struct iov_iter *from);
 int fuse_dax_mmap(struct file *file, struct vm_area_struct *vma);
 int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start, u64 dmap_end);
-int fuse_dax_conn_alloc(struct fuse_conn *fc, struct dax_device *dax_dev);
+int fuse_dax_conn_alloc(struct fuse_conn *fc, unsigned int mode,
+			struct dax_device *dax_dev);
 void fuse_dax_conn_free(struct fuse_conn *fc);
 bool fuse_dax_inode_alloc(struct super_block *sb, struct fuse_inode *fi);
 void fuse_dax_inode_init(struct inode *inode);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index b9beb39a4a18..f6b46395edb2 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1434,7 +1434,7 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 	sb->s_subtype = ctx->subtype;
 	ctx->subtype = NULL;
 	if (IS_ENABLED(CONFIG_FUSE_DAX)) {
-		err = fuse_dax_conn_alloc(fc, ctx->dax_dev);
+		err = fuse_dax_conn_alloc(fc, ctx->dax, ctx->dax_dev);
 		if (err)
 			goto err;
 	}
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 8f52cdaa8445..561f711d1945 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -88,12 +88,21 @@ struct virtio_fs_req_work {
 static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 				 struct fuse_req *req, bool in_flight);
 
+static const struct constant_table dax_param_enums[] = {
+	{"inode",	FUSE_DAX_MOUNT_INODE },
+	{"always",	FUSE_DAX_MOUNT_ALWAYS },
+	{"never",	FUSE_DAX_MOUNT_NEVER },
+	{}
+};
+
 enum {
 	OPT_DAX,
+	OPT_DAX_ENUM,
 };
 
 static const struct fs_parameter_spec virtio_fs_parameters[] = {
 	fsparam_flag("dax", OPT_DAX),
+	fsparam_enum("dax", OPT_DAX_ENUM, dax_param_enums),
 	{}
 };
 
@@ -110,7 +119,10 @@ static int virtio_fs_parse_param(struct fs_context *fc,
 
 	switch (opt) {
 	case OPT_DAX:
-		ctx->dax = 1;
+		ctx->dax = FUSE_DAX_MOUNT_ALWAYS;
+		break;
+	case OPT_DAX_ENUM:
+		ctx->dax = result.uint_32;
 		break;
 	default:
 		return -EINVAL;
@@ -1326,7 +1338,7 @@ static int virtio_fs_fill_super(struct super_block *sb, struct fs_context *fsc)
 
 	/* virtiofs allocates and installs its own fuse devices */
 	ctx->fudptr = NULL;
-	if (ctx->dax) {
+	if (ctx->dax != FUSE_DAX_MOUNT_NEVER) {
 		if (!fs->dax_dev) {
 			err = -EINVAL;
 			pr_err("virtio-fs: dax can't be enabled as filesystem"
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
