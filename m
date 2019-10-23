Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F9E1214
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 08:25:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D1D0EB62;
	Wed, 23 Oct 2019 06:25:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CBC6AAF3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 06:25:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 51E8D14D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 06:25:33 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D4C0CF4705001F0471B5;
	Wed, 23 Oct 2019 14:25:28 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
	14:25:19 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <vgoyal@redhat.com>, <stefanha@redhat.com>, <miklos@szeredi.hu>,
	<mszeredi@redhat.com>
Subject: [PATCH -next] virtiofs: remove unused variable 'fc'
Date: Wed, 23 Oct 2019 14:21:30 +0800
Message-ID: <20191023062130.23068-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-fsdevel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

fs/fuse/virtio_fs.c:983:20: warning:
 variable fc set but not used [-Wunused-but-set-variable]

It is not used since commit 7ee1e2e631db ("virtiofs:
No need to check fpq->connected state")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/fuse/virtio_fs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 2de8fc0..a5c8604 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -980,7 +980,6 @@ __releases(fiq->lock)
 {
 	unsigned int queue_id = VQ_REQUEST; /* TODO multiqueue */
 	struct virtio_fs *fs;
-	struct fuse_conn *fc;
 	struct fuse_req *req;
 	struct virtio_fs_vq *fsvq;
 	int ret;
@@ -993,7 +992,6 @@ __releases(fiq->lock)
 	spin_unlock(&fiq->lock);
 
 	fs = fiq->priv;
-	fc = fs->vqs[queue_id].fud->fc;
 
 	pr_debug("%s: opcode %u unique %#llx nodeid %#llx in.len %u out.len %u\n",
 		  __func__, req->in.h.opcode, req->in.h.unique,
-- 
2.7.4


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
