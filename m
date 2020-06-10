Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 350131F50AA
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 10:59:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 955B586E74;
	Wed, 10 Jun 2020 08:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEicWNnq7SPw; Wed, 10 Jun 2020 08:59:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1ECA886E66;
	Wed, 10 Jun 2020 08:59:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8D31C016F;
	Wed, 10 Jun 2020 08:59:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0069DC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 08:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D6BA622D24
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 08:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EyMydaoaNYyY
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 08:59:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by silver.osuosl.org (Postfix) with ESMTPS id 2500622850
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 08:59:21 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05A8uuKl120764;
 Wed, 10 Jun 2020 08:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=l8OVWVLK/YojBt1CbcoP4Q4ZOTmKu98o9cgNBUL6IMc=;
 b=F9g9fIgKsRXzFP6FtdbTq3QKJkuONZVmm2ELXAzpuz9fmIQ7bxAhSnuq4Yn9z59q5rhp
 7bu7Q5M4cuv0wqLRgykofUF28wzt7ALWZ4ej4gQel/w49LokGcBi/7cmofViAMgt3JE2
 pa0nJCA1hcJ6NyNaQ9tFCp+bsoGxORtBCEbc2PgoQ1VImbZToicjjjsqgfa8FXbZs4V6
 xyWQgELau8p2mQOo9GX/T8N6nBonSQCmxG6UktavCISEhFagvXHcyzF/GclSOkqrdRSo
 VYMLyOZg0MuMq3fpZ6WGjDvEZT9dVcVCMNI00W8b33e5sHn5CIg22KaIH7lwNf0F0Aga fQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 31g3sn14qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Jun 2020 08:59:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05A8wQgJ139538;
 Wed, 10 Jun 2020 08:59:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 31gn28e1b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 08:59:19 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05A8xI73013102;
 Wed, 10 Jun 2020 08:59:18 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 10 Jun 2020 01:59:17 -0700
Date: Wed, 10 Jun 2020 11:59:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Hildenbrand <david@redhat.com>
Subject: [PATCH] virtio-mem: silence a static checker warning
Message-ID: <20200610085911.GC5439@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9647
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=971
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9647
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 cotscore=-2147483648 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006100069
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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

Smatch complains that "rc" can be uninitialized if we hit the "break;"
statement on the first iteration through the loop.  I suspect that this
can't happen in real life, but returning a zero literal is cleaner and
silence the static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/virtio/virtio_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index f658fe9149beb..893ef18060a02 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1192,7 +1192,7 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
 						VIRTIO_MEM_MB_STATE_OFFLINE);
 	}
 
-	return rc;
+	return 0;
 }
 
 /*
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
