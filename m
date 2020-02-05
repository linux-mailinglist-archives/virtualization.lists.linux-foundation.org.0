Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70C15354C
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 17:34:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83CF6834EE;
	Wed,  5 Feb 2020 16:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1oQbnSdu4rw; Wed,  5 Feb 2020 16:34:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A64D583468;
	Wed,  5 Feb 2020 16:34:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93375C0174;
	Wed,  5 Feb 2020 16:34:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBB31C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 16:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B7ED981F17
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 16:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evqcp0WhZraJ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 16:34:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 51A6E811E5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580920469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rexFf3u9dwOgKF8qwa6CKc29pRBkdXMGcoOgim7g7N4=;
 b=J+eWADXWUbErhhvsCbVlsUz4vFCQ57Tc8LUDBN4e8q5CAMLVKDG6dFLy+wJj49NBc52F44
 ReG7RGWfIEMDbpoBt0Yq+Yno0Lh7Lv/R7/mh9sUn+N2mPIFJl+VJfcogkJfG2ac7hzr/I2
 g1e693UvTRpepPaQSE9Wv0SPGx77fnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-ei-AHbADN5qyeyeQL7fMRw-1; Wed, 05 Feb 2020 11:34:13 -0500
X-MC-Unique: ei-AHbADN5qyeyeQL7fMRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64CD4190D37B;
 Wed,  5 Feb 2020 16:34:11 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-217.ams2.redhat.com [10.36.116.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F28231001B05;
 Wed,  5 Feb 2020 16:34:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] virtio-balloon: Fixes + switch back to OOM handler
Date: Wed,  5 Feb 2020 17:33:59 +0100
Message-Id: <20200205163402.42627-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Liang Li <liang.z.li@intel.com>, virtualization@lists.linux-foundation.org,
 Tyler Sanderson <tysand@google.com>, linux-mm@kvack.org,
 "Michael S. Tsirkin" <mst@redhat.com>, David Rientjes <rientjes@google.com>,
 Nadav Amit <namit@vmware.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

Two fixes for issues I stumbled over while working on patch #3.

Switch back to the good ol' OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM
as the switch to the shrinker introduce some undesired side effects. Keep
the shrinker in place to handle VIRTIO_BALLOON_F_FREE_PAGE_HINT.
Lengthy discussion under [1].

I tested with QEMU and "deflate-on-oom=on". Works as expected. Did not
test the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, as it is
hard to trigger (only when migrating a VM, and even then, it might not
trigger).

[1] https://www.spinics.net/lists/linux-virtualization/msg40863.html

David Hildenbrand (3):
  virtio-balloon: Fix memory leak when unloading while hinting is in
    progress
  virtio_balloon: Fix memory leaks on errors in virtballoon_probe()
  virtio-balloon: Switch back to OOM handler for
    VIRTIO_BALLOON_F_DEFLATE_ON_OOM

 drivers/virtio/virtio_balloon.c | 124 +++++++++++++++-----------------
 1 file changed, 57 insertions(+), 67 deletions(-)

-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
