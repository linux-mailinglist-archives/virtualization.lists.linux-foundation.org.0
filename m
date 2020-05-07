Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBB1C8D4E
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 16:03:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ECF838854F;
	Thu,  7 May 2020 14:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdOXrGtRTB+r; Thu,  7 May 2020 14:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 44B19885E3;
	Thu,  7 May 2020 14:03:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 308F3C07FF;
	Thu,  7 May 2020 14:03:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05887C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E84958854F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iDrOOhmXJNs
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3E9AC8854D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588860226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQE6Fj9xYvu+P4zbftVLGWaR4OQoP1nVDad5+xQPmXI=;
 b=PNtqBmqilLcbnGPiKYcydUeubnxMSgP2yWWWiuAz6aQOfs1GERx/v6Nf8BIgSVKvH9jcCl
 StIXTIORm5+BUaiVg/KT+6IUnQl0/R4yPo2aoCjjTyZMKEtMjg4EB9f9On+ohYrP2CdMna
 h0RHsSiiRFyMkg0LFuRw+7pvnwZgx6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-x7S63w-dMNqHLM4S_PsjfA-1; Thu, 07 May 2020 10:03:42 -0400
X-MC-Unique: x7S63w-dMNqHLM4S_PsjfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CBF41895954;
 Thu,  7 May 2020 14:03:41 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE7760BEC;
 Thu,  7 May 2020 14:03:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/15] virtio-mem: Use -ETXTBSY as error code if the device
 is busy
Date: Thu,  7 May 2020 16:01:38 +0200
Message-Id: <20200507140139.17083-15-david@redhat.com>
In-Reply-To: <20200507140139.17083-1-david@redhat.com>
References: <20200507140139.17083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org
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

Let's be able to distinguish if the device or if memory is busy.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index a719e1a04ac7..abd93b778a26 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -893,7 +893,7 @@ static int virtio_mem_send_plug_request(struct virtio_mem *vm, uint64_t addr,
 	case VIRTIO_MEM_RESP_NACK:
 		return -EAGAIN;
 	case VIRTIO_MEM_RESP_BUSY:
-		return -EBUSY;
+		return -ETXTBSY;
 	case VIRTIO_MEM_RESP_ERROR:
 		return -EINVAL;
 	default:
@@ -919,7 +919,7 @@ static int virtio_mem_send_unplug_request(struct virtio_mem *vm, uint64_t addr,
 		vm->plugged_size -= size;
 		return 0;
 	case VIRTIO_MEM_RESP_BUSY:
-		return -EBUSY;
+		return -ETXTBSY;
 	case VIRTIO_MEM_RESP_ERROR:
 		return -EINVAL;
 	default:
@@ -941,7 +941,7 @@ static int virtio_mem_send_unplug_all_request(struct virtio_mem *vm)
 		atomic_set(&vm->config_changed, 1);
 		return 0;
 	case VIRTIO_MEM_RESP_BUSY:
-		return -EBUSY;
+		return -ETXTBSY;
 	default:
 		return -ENOMEM;
 	}
@@ -1557,11 +1557,15 @@ static void virtio_mem_run_wq(struct work_struct *work)
 		 * or we have too many offline memory blocks.
 		 */
 		break;
-	case -EBUSY:
+	case -ETXTBSY:
 		/*
 		 * The hypervisor cannot process our request right now
-		 * (e.g., out of memory, migrating) or we cannot free up
-		 * any memory to unplug it (all plugged memory is busy).
+		 * (e.g., out of memory, migrating);
+		 */
+	case -EBUSY:
+		/*
+		 * We cannot free up any memory to unplug it (all plugged memory
+		 * is busy).
 		 */
 	case -ENOMEM:
 		/* Out of memory, try again later. */
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
