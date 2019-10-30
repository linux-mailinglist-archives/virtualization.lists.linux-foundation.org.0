Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C46E9E9E62
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 16:08:06 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EDA60E62;
	Wed, 30 Oct 2019 15:07:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6116EE52
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:07:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3E9178A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572448069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=sOEwas89nJkqsGmIKgnOb7SyquuodU2BlF653zxQHMc=;
	b=ReaOLWEN9yhg3SmbWbVh+XbqBrmGEo2ExI7wJYEubMAXfH44cB2YdPySP05Hqzjq8NngB/
	y2fUmCvQ2aL7kGUtu28SCwCGoGQU/3ECfgtTGPSEQ7IT0zEFGs4IlKBan7VWU4ZgouEPue
	ZYDBckk3RKWLWgLIvQ5QQI8/IRyCBNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-400-YKMwK29qOfSnBVTuxpoyKA-1; Wed, 30 Oct 2019 11:07:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF857800C61;
	Wed, 30 Oct 2019 15:07:44 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B25C5DA70;
	Wed, 30 Oct 2019 15:07:39 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id DBFFE223A56; Wed, 30 Oct 2019 11:07:38 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtio-fs@redhat.com
Subject: [PATCH 2/3] virtiofs: Do not send forget request "struct list_head"
	element
Date: Wed, 30 Oct 2019 11:07:18 -0400
Message-Id: <20191030150719.29048-3-vgoyal@redhat.com>
In-Reply-To: <20191030150719.29048-1-vgoyal@redhat.com>
References: <20191030150719.29048-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: YKMwK29qOfSnBVTuxpoyKA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dgilbert@redhat.com, miklos@szeredi.hu, stefanha@redhat.com,
	vgoyal@redhat.com, virtualization@lists.linux-foundation.org
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

We are sending whole of virtio_fs_foreget struct to the other end over
virtqueue. Other end does not need to see elements like "struct list".
That's internal detail of guest kernel. Fix it.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/fuse/virtio_fs.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 6cc7be170cb8..43224db8d9ed 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -48,11 +48,15 @@ struct virtio_fs {
 	unsigned int num_request_queues; /* number of request queues */
 };
 
-struct virtio_fs_forget {
+struct virtio_fs_forget_req {
 	struct fuse_in_header ih;
 	struct fuse_forget_in arg;
+};
+
+struct virtio_fs_forget {
 	/* This request can be temporarily queued on virt queue */
 	struct list_head list;
+	struct virtio_fs_forget_req req;
 };
 
 static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
@@ -325,6 +329,7 @@ static int send_forget_request(struct virtio_fs_vq *fsvq,
 	struct virtqueue *vq;
 	int ret = 0;
 	bool notify;
+	struct virtio_fs_forget_req *req = &forget->req;
 
 	spin_lock(&fsvq->lock);
 	if (!fsvq->connected) {
@@ -334,7 +339,7 @@ static int send_forget_request(struct virtio_fs_vq *fsvq,
 		goto out;
 	}
 
-	sg_init_one(&sg, forget, sizeof(*forget));
+	sg_init_one(&sg, req, sizeof(*req));
 	vq = fsvq->vq;
 	dev_dbg(&vq->vdev->dev, "%s\n", __func__);
 
@@ -730,6 +735,7 @@ __releases(fiq->lock)
 {
 	struct fuse_forget_link *link;
 	struct virtio_fs_forget *forget;
+	struct virtio_fs_forget_req *req;
 	struct virtio_fs *fs;
 	struct virtio_fs_vq *fsvq;
 	u64 unique;
@@ -743,14 +749,15 @@ __releases(fiq->lock)
 
 	/* Allocate a buffer for the request */
 	forget = kmalloc(sizeof(*forget), GFP_NOFS | __GFP_NOFAIL);
+	req = &forget->req;
 
-	forget->ih = (struct fuse_in_header){
+	req->ih = (struct fuse_in_header){
 		.opcode = FUSE_FORGET,
 		.nodeid = link->forget_one.nodeid,
 		.unique = unique,
-		.len = sizeof(*forget),
+		.len = sizeof(*req),
 	};
-	forget->arg = (struct fuse_forget_in){
+	req->arg = (struct fuse_forget_in){
 		.nlookup = link->forget_one.nlookup,
 	};
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
