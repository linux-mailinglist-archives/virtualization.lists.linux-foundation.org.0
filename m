Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3833374AE
	for <lists.virtualization@lfdr.de>; Thu, 11 Mar 2021 14:53:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 465AD431DE;
	Thu, 11 Mar 2021 13:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrSFjK0Wti3R; Thu, 11 Mar 2021 13:53:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01783431D7;
	Thu, 11 Mar 2021 13:53:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95E33C0001;
	Thu, 11 Mar 2021 13:53:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF2DDC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0C8E605EC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-EjlOJfh4is
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 747DF6059B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615470788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=59EuosthGHx5pcdxoFo5VSdTfTOx4fAiPVEz1PyRq70=;
 b=MvjvTvU9I+BRyLrlPjOXsXa3NYFzRJDanzmt3m/H3CcOUQOe19UmGwzHeF9/yyRd07/wyY
 /UH1h+Wz8pAlFqqL+CvkONYkQXQ5ND2a1IxXhDnGvXmuE4eb/hwESghBQ6ou+pjTo8f812
 +WOSccn2cCDDEoGKYzzpo4xPkpGeD6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326--AguXVqBONyBY1GEZFmkUw-1; Thu, 11 Mar 2021 08:53:04 -0500
X-MC-Unique: -AguXVqBONyBY1GEZFmkUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B554C100C618;
 Thu, 11 Mar 2021 13:53:03 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-146.ams2.redhat.com
 [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D748A196E3;
 Thu, 11 Mar 2021 13:52:58 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 0/2] vhost-vdpa: fix issues around v->config_ctx handling
Date: Thu, 11 Mar 2021 14:52:55 +0100
Message-Id: <20210311135257.109460-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhu Lingshan <lingshan.zhu@intel.com>
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

While writing a test for a Rust library [1] to handle vhost-vdpa devices,
I experienced the 'use-after-free' issue fixed in patch 1, then I
discovered the potential issue when eventfd_ctx_fdget() fails fixed in
patch 2.

Do you think it might be useful to write a vdpa test suite, perhaps using
this Rust library [2] ?
Could we put it in the kernel tree in tool/testing?

Thanks,
Stefano

[1] https://github.com/stefano-garzarella/vhost/tree/vdpa
[2] https://github.com/rust-vmm/vhost

Stefano Garzarella (2):
  vhost-vdpa: fix use-after-free of v->config_ctx
  vhost-vdpa: set v->config_ctx to NULL if eventfd_ctx_fdget() fails

 drivers/vhost/vdpa.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
