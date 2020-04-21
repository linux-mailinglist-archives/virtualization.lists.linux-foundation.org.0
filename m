Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F004A1B21E4
	for <lists.virtualization@lfdr.de>; Tue, 21 Apr 2020 10:43:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4D35B221A9;
	Tue, 21 Apr 2020 08:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpT8Hxfidr8s; Tue, 21 Apr 2020 08:43:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7E62222859;
	Tue, 21 Apr 2020 08:43:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B903C0175;
	Tue, 21 Apr 2020 08:43:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23744C0175
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 08:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0E2368644F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 08:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-ndktxoRJ1a
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 08:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6EEC285BD3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587458588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9iDz7iWPK0i9U6uK8B+Kq/VOxGdFwzyl3Psdz4sCMdw=;
 b=a4DvaxSgObrQLeudG3vniZ9F/+GbrmPNqrSZQ3zqIy+y6bbWx1t4EwzsPmM2NhNZKwQwca
 1TMp/oY9HW/lOZTWhLe8xn0HCzVg4MPbCRfo5GpV2TTLGmHuTz/SlEWvgINwcd8VzpFry+
 Wcv+LjvBZkipW6nKkzAcMoOmnNbOKIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-2FtRnLJzNz2bXqouSQxh6Q-1; Tue, 21 Apr 2020 04:43:04 -0400
X-MC-Unique: 2FtRnLJzNz2bXqouSQxh6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD0F190B2A0;
 Tue, 21 Apr 2020 08:43:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5A351001B30;
 Tue, 21 Apr 2020 08:43:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB34016E16; Tue, 21 Apr 2020 10:43:00 +0200 (CEST)
Date: Tue, 21 Apr 2020 10:43:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Caicai <caizhaopeng@uniontech.com>
Subject: Re: [PATCH 1/1] drm/qxl: add mutex_lock/mutex_unlock to ensure the
 order in which resources are released.
Message-ID: <20200421084300.zggroiptwbrblzqy@sirius.home.kraxel.org>
References: <20200418063917.26278-1-caizhaopeng@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200418063917.26278-1-caizhaopeng@uniontech.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Zhangshuang <zhangshuang@uniontech.com>,
 Zhangyueqian <zhangyueqian@uniontech.com>, Dave Airlie <airlied@redhat.com>,
 Zhangshiwen <zhangshiwen@uniontech.com>
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

On Sat, Apr 18, 2020 at 02:39:17PM +0800, Caicai wrote:
> When a qxl resource is released, the list that needs to be released is
> fetched from the linked list ring and cleared. When you empty the list,
> instead of trying to determine whether the ttm buffer object for each
> qxl in the list is locked, you release the qxl object and remove the
> element from the list until the list is empty. It was found that the
> linked list was cleared first, and that the lock on the corresponding
> ttm Bo for the QXL had not been released, so that the new qxl could not
> be locked when it used the TTM.

So the dma_resv_reserve_shared() call in qxl_release_validate_bo() is
unbalanced?  Because the dma_resv_unlock() call in
qxl_release_fence_buffer_objects() never happens due to
qxl_release_free_list() clearing the list beforehand?  Is that correct?

The only way I see for this to happen is that the guest is preempted
between qxl_push_{cursor,command}_ring_release() and
qxl_release_fence_buffer_objects() calls.  The host can complete the qxl
command then, signal the guest, and the IRQ handler calls
qxl_release_free_list() before qxl_release_fence_buffer_objects() runs.

Looking through the code I think it should be safe to simply swap the
qxl_release_fence_buffer_objects() +
qxl_push_{cursor,command}_ring_release() calls to close that race
window.  Can you try that and see if it fixes the bug for you?

>  		if (flush)
> -			flush_work(&qdev->gc_work);
> +			//can't flush work, it may lead to deadlock
> +			usleep_range(500, 1000);
> +

The commit message doesn't explain this chunk.

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
