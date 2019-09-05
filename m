Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BEAAC61
	for <lists.virtualization@lfdr.de>; Thu,  5 Sep 2019 21:51:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D61B716AC;
	Thu,  5 Sep 2019 19:49:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D4C7D1707
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 19:49:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 900AF89C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 19:49:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDE0A883823;
	Thu,  5 Sep 2019 19:49:25 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6B46012D;
	Thu,  5 Sep 2019 19:49:18 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id B6929220292; Thu,  5 Sep 2019 15:49:17 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	miklos@szeredi.hu
Subject: [PATCH 00/18] virtiofs: Fix various races and cleanups round 1
Date: Thu,  5 Sep 2019 15:48:41 -0400
Message-Id: <20190905194859.16219-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Thu, 05 Sep 2019 19:49:26 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mst@redhat.com, linux-kernel@vger.kernel.org, dgilbert@redhat.com,
	virtio-fs@redhat.com, stefanha@redhat.com, vgoyal@redhat.com
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

Hi,

Michael Tsirkin pointed out issues w.r.t various locking related TODO
items and races w.r.t device removal. 

In this first round of cleanups, I have taken care of most pressing
issues.

These patches apply on top of following.

git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtiofs-v4

I have tested these patches with mount/umount and device removal using
qemu monitor. For example.

virsh qemu-monitor-command --hmp vm9-f28 device_del myvirtiofs

Now a mounted device can be removed and file system will return errors
-ENOTCONN and one can unmount it.

Miklos, if you are fine with the patches, I am fine if you fold these
all into existing patch. I kept them separate so that review is easier.

Any feedback or comments are welcome.

Thanks
Vivek


Vivek Goyal (18):
  virtiofs: Remove request from processing list before calling end
  virtiofs: Check whether hiprio queue is connected at submission time
  virtiofs: Pass fsvq instead of vq as parameter to
    virtio_fs_enqueue_req
  virtiofs: Check connected state for VQ_REQUEST queue as well
  Maintain count of in flight requests for VQ_REQUEST queue
  virtiofs: ->remove should not clean virtiofs fuse devices
  virtiofs: Stop virtiofs queues when device is being removed
  virtiofs: Drain all pending requests during ->remove time
  virtiofs: Add an helper to start all the queues
  virtiofs: Do not use device managed mem for virtio_fs and virtio_fs_vq
  virtiofs: stop and drain queues after sending DESTROY
  virtiofs: Use virtio_fs_free_devs() in error path
  virtiofs: Do not access virtqueue in request submission path
  virtiofs: Add a fuse_iqueue operation to put() reference
  virtiofs: Make virtio_fs object refcounted
  virtiofs: Use virtio_fs_mutex for races w.r.t ->remove and mount path
  virtiofs: Remove TODO to quiesce/end_requests
  virtiofs: Remove TODO item from virtio_fs_free_devs()

 fs/fuse/fuse_i.h    |   5 +
 fs/fuse/inode.c     |   6 +
 fs/fuse/virtio_fs.c | 259 ++++++++++++++++++++++++++++++++------------
 3 files changed, 198 insertions(+), 72 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
