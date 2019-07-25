Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 853AE75636
	for <lists.virtualization@lfdr.de>; Thu, 25 Jul 2019 19:51:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 58BCDDDD;
	Thu, 25 Jul 2019 17:50:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E9A52DCA
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 17:50:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9E75EB0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 17:50:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECDB630A7C7C;
	Thu, 25 Jul 2019 17:50:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-187.ams2.redhat.com
	[10.36.117.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79FA7605C3;
	Thu, 25 Jul 2019 17:50:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: virtualization@lists.linux-foundation.org, mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 0/4] virtio: Add definitions for shared memory regions
Date: Thu, 25 Jul 2019 18:50:40 +0100
Message-Id: <20190725175044.29303-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 25 Jul 2019 17:50:53 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: sebastien.boeuf@intel.com, vgoyal@redhat.com, stefanha@redhat.com
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add the virtio shared memory region definitions that
have just got merged into the spec.

Dr. David Alan Gilbert (4):
  virtio_pci: Define id field
  virtio_pci: Define virtio_pci_cap64
  virtio_pci: Defined shared memory capability
  virito_mmio: Define shared memory region registers

 include/uapi/linux/virtio_mmio.h | 11 +++++++++++
 include/uapi/linux/virtio_pci.h  | 11 ++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
