Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0212501D
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 19:07:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1860F86BED;
	Wed, 18 Dec 2019 18:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkH8GTO_EJKk; Wed, 18 Dec 2019 18:07:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3DDD86BA3;
	Wed, 18 Dec 2019 18:07:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9963BC077D;
	Wed, 18 Dec 2019 18:07:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4712C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 93F7787117
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZxQW9mBEJLs
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EE35B87645
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576692448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8qrytZMVdHBi4BdEHQin5N9/kMWlYC5/mlW+wdXOXw=;
 b=YvoIhn7OMa9FYXAxQtGbL7ooJOIxrvLsSBs0xrBLs+9fT7ozdy7voU3YBSqw2PV5JsoAun
 f/znVuIvFgcAVCJsg8XLJGTRBOIW6FaZTuAi5gWDxTmabtSNY/VtO0NmvJ6VQFXNZa9fFc
 ez7WCUDpIAAPbvx59TdZMQ9xE27CraY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-rwlitvt8O5W6vyhltMDwnw-1; Wed, 18 Dec 2019 13:07:24 -0500
X-MC-Unique: rwlitvt8O5W6vyhltMDwnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 113F38024F7;
 Wed, 18 Dec 2019 18:07:23 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-218.ams2.redhat.com
 [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFB7B5D9E2;
 Wed, 18 Dec 2019 18:07:18 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net-next v3 02/11] VSOCK: add SPDX identifiers to vsock tests
Date: Wed, 18 Dec 2019 19:06:59 +0100
Message-Id: <20191218180708.120337-3-sgarzare@redhat.com>
In-Reply-To: <20191218180708.120337-1-sgarzare@redhat.com>
References: <20191218180708.120337-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jorgen Hansen <jhansen@vmware.com>
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
 * Aligned with the current SPDX [Stefano]
---
 tools/testing/vsock/control.h | 1 +
 tools/testing/vsock/timeout.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/testing/vsock/control.h b/tools/testing/vsock/control.h
index 54a07efd267c..dac3964a891d 100644
--- a/tools/testing/vsock/control.h
+++ b/tools/testing/vsock/control.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef CONTROL_H
 #define CONTROL_H
 
diff --git a/tools/testing/vsock/timeout.h b/tools/testing/vsock/timeout.h
index 77db9ce9860a..ecb7c840e65a 100644
--- a/tools/testing/vsock/timeout.h
+++ b/tools/testing/vsock/timeout.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef TIMEOUT_H
 #define TIMEOUT_H
 
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
