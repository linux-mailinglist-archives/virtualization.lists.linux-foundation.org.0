Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ACEE8632
	for <lists.virtualization@lfdr.de>; Tue, 29 Oct 2019 11:59:23 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AF2971354;
	Tue, 29 Oct 2019 10:59:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6AEDB1339
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 10:59:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C3C088A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572346753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=4H37NaZ5rR8UXp8a7OmDerkp1JUcZ+4ZN2lsi4O5BPY=;
	b=A87rgvcr9JiWYd+LtbwOpjLit1b7QJ5pgW8yGP49pj+gEFFzY5GK3F4/iVHPhD0OP4kJya
	JB1VQjGX4WLvmlzHxtcrSw0/fx5HikLNuzoDFkhdVlqOMmAiLpC2bUTge2+1BWU0UzlMld
	5ktMvs/Wg6/eGXF3x60txldLEMGaH+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-353-voWsV6VkMl6WJ232Z5GOIg-1; Tue, 29 Oct 2019 06:59:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FCF21005500;
	Tue, 29 Oct 2019 10:59:08 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-223.pek2.redhat.com [10.72.12.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A8395C1B2;
	Tue, 29 Oct 2019 10:58:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] virtio: allow per vq DMA domain
Date: Tue, 29 Oct 2019 18:58:41 +0800
Message-Id: <20191029105843.12061-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: voWsV6VkMl6WJ232Z5GOIg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: lingshan.zhu@intel.com, lulu@redhat.com, zhihong.wang@intel.com
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

We used to have use a single parent for all DMA operations. This tends
to complicate the mdev based hardware virtio datapath offloading which
may not implement the control path over datapath like ctrl vq in the
case of virtio-net.

So this series tries to intorduce per DMA domain by allowing trasnport
to specify the parent device for each virtqueue. Then for the case of
virtio-mdev device, it can hook the DMA ops for control vq back to
itself and then using e.g VA or PA to emulate the control virtqueue
operation.

Vhost-mdev may use similar idea. Note, compiling test only.

Jason Wang (2):
  virtio: accept parent as a parameter when allocating virtqueue
  virtio: allow query vq parent device

 drivers/virtio/virtio_ring.c  | 36 +++++++++++++++++++++++++----------
 include/linux/virtio_config.h |  2 ++
 2 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
