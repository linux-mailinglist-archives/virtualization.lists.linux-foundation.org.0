Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616D11D340
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:12:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57D93883D8;
	Thu, 12 Dec 2019 17:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxFp9K2iXRq0; Thu, 12 Dec 2019 17:12:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C535883DF;
	Thu, 12 Dec 2019 17:12:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2445FC1D81;
	Thu, 12 Dec 2019 17:12:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01D39C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E291E883D6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLvDLn8woTdR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C37E5883D5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmqYn0neP7Ig3ATfsZz5/1LWePBeC7WoQLfsRAoMt5Y=;
 b=bqmm4JR1EAUnjFySmLAwcvqAonI2OKzMSWChmyRqUnmo5HSErvA1wlGH3sODoltGgjzT/T
 e70sS9Yo263jSaQ1lX7NUQV7cGo68zK7dONpVmBjKKa0YTgESBUIoEFwfNOi/9bZJK5bBm
 GDL+ro2ul9HcXOLgUI7jMzOovCNZJa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-nHjKpbVVOHCedEn6dfr4Uw-1; Thu, 12 Dec 2019 12:12:08 -0500
X-MC-Unique: nHjKpbVVOHCedEn6dfr4Uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C792718A6EC0;
 Thu, 12 Dec 2019 17:12:06 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC3725C21B;
 Thu, 12 Dec 2019 17:11:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 01/13] ACPI: NUMA: export pxm_to_node
Date: Thu, 12 Dec 2019 18:11:25 +0100
Message-Id: <20191212171137.13872-2-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org, linux-acpi@vger.kernel.org,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org, Len Brown <lenb@kernel.org>
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

Will be needed by virtio-mem to identify the node from a pxm.

Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/acpi/numa/srat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index eadbf90e65d1..d5847fa7ac69 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -35,6 +35,7 @@ int pxm_to_node(int pxm)
 		return NUMA_NO_NODE;
 	return pxm_to_node_map[pxm];
 }
+EXPORT_SYMBOL(pxm_to_node);
 
 int node_to_pxm(int node)
 {
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
