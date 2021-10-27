Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFC43BF9C
	for <lists.virtualization@lfdr.de>; Wed, 27 Oct 2021 04:21:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF8F14022F;
	Wed, 27 Oct 2021 02:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oD9Lz1OXhoXh; Wed, 27 Oct 2021 02:21:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 50B6F401A0;
	Wed, 27 Oct 2021 02:21:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8558C000E;
	Wed, 27 Oct 2021 02:21:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A29BEC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 02:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84B0840476
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 02:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePCl-f36FNzj
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 02:21:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3E7440471
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 02:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635301307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdOuNDX3/xmLdrBREE9VW7efZLufc82SxJkpEXQ7fj8=;
 b=Q2HpPPE4+ytP/YdFJdVu6yxU7RSJ2PZ9lrNvv8MKviupgrd/69Rbm8O0oKD8rW58Bpzzdy
 90nV39056AeTqBrJQ6Gk45cqPEDnXEd3EqsD4TVgPB4XxCJS6NJR4Eah4XYPkTqaDVGAa2
 E+RX66BfL198j/hsgxCkm702Z9v9T6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-wJk4akncN0CN9spdiRSsJw-1; Tue, 26 Oct 2021 22:21:44 -0400
X-MC-Unique: wJk4akncN0CN9spdiRSsJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E2A8802B61;
 Wed, 27 Oct 2021 02:21:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-228.pek2.redhat.com
 [10.72.13.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D851D19729;
 Wed, 27 Oct 2021 02:21:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	virtualization@lists.linux-foundation.org
Subject: [PATCH V5 4/4] virtio-scsi: don't let virtio core to validate used
 buffer length
Date: Wed, 27 Oct 2021 10:21:07 +0800
Message-Id: <20211027022107.14357-5-jasowang@redhat.com>
In-Reply-To: <20211027022107.14357-1-jasowang@redhat.com>
References: <20211027022107.14357-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: f.hetzelt@tu-berlin.de, linux-kernel@vger.kernel.org, david.kaplan@amd.com,
 konrad.wilk@oracle.com
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

We never tries to use used length, so the patch prevents the virtio
core from validating used length.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/scsi/virtio_scsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 07d0250f17c3..03b09ecea42d 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -977,6 +977,7 @@ static unsigned int features[] = {
 static struct virtio_driver virtio_scsi_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
+	.suppress_used_validation = true,
 	.driver.name = KBUILD_MODNAME,
 	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
