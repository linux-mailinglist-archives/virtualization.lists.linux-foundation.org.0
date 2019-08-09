Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D518725E
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 08:49:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 30741C4E;
	Fri,  9 Aug 2019 06:48:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 19FE4AF0
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 06:48:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B7871829
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 06:48:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E8F72CD811;
	Fri,  9 Aug 2019 06:48:54 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (unknown [10.65.16.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46ADF1001925;
	Fri,  9 Aug 2019 06:48:49 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: amit@kernel.org,
	mst@redhat.com
Subject: [PATCH v3 0/2] virtio_console: fix replug of virtio console port
Date: Fri,  9 Aug 2019 12:18:45 +0530
Message-Id: <20190809064847.28918-1-pagupta@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Aug 2019 06:48:54 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pagupta@redhat.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, xiaohli@redhat.com
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

This patch series fixes the issue with unplug/replug of a port in virtio
console driver which fails with an error "Error allocating inbufs\n".
Patch 1 makes use of 'virtqueue_detach_unused_buf' function to detach
the unused buffers during port hotunplug time.
Patch 2 updates the next avail index for packed ring code.
Tested the packed ring code with the qemu virtio 1.1 device code posted
here [1].

Changes from v2
 Better change log in patch2 - [Greg]
Changes from v1[2]
 Make virtio packed ring code compatible with split ring - [Michael]

[1]  https://marc.info/?l=qemu-devel&m=156471883703948&w=2
[2]  https://lkml.org/lkml/2019/3/4/517

Pankaj Gupta (2):
  virtio_console: free unused buffers with port delete
  virtio: decrement avail idx with buffer detach for packed ring

 char/virtio_console.c |   14 +++++++++++---
 virtio/virtio_ring.c  |    6 ++++++
 2 files changed, 17 insertions(+), 3 deletions(-)
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
