Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FC519E430
	for <lists.virtualization@lfdr.de>; Sat,  4 Apr 2020 11:41:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E6C286268;
	Sat,  4 Apr 2020 09:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YN-gUeAqAHPR; Sat,  4 Apr 2020 09:41:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1ED6A8629B;
	Sat,  4 Apr 2020 09:41:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0988DC1D87;
	Sat,  4 Apr 2020 09:41:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B007C07FF
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 09:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E9C5E8733E
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 09:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BizZMK5NPSzW
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 09:41:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8309787476
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/tDvMcpQEBI9S68wHOZLUB3dDI6IS68bO71B9/9EwUE=; b=CThSaAilR3ovdk8YHEBYWt5Ywb
 +Ig6dXA4SCkBKlwyH+dnd9gAgLYDklih2fs3Sb/j0+a+tRF+2om4l+ZEMhYbZmkdlBtdFVjiOQh6i
 rsAU0NmW5zgW+9jcbnYb4/kuzcl5lzPPmnD2sruNcp/WjLsPVH8LEVgHKSxKPKtGQYFGDWE4qpe1/
 DN2i1aQV0nYWQyrfC3Q3YeHvjhe4lq6+1lGucDhrbtE0PvUI/PauoxgjTggfvH5eWTsh+88FTmiYE
 czENSm+bnFheaetCcE3kGE4wi0mZP4UK4qBRnn/gHR5USuqGiVuvVJn8j4hTaI6SxpNERUEcH8AUT
 3r99EnWQ==;
Received: from [2001:4bb8:180:7914:2ca6:9476:bbfa:a4d0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKfIf-0002dK-G0; Sat, 04 Apr 2020 09:41:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/6] i915/gvt: remove unused xen bits
Date: Sat,  4 Apr 2020 11:40:58 +0200
Message-Id: <20200404094101.672954-4-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200404094101.672954-1-hch@lst.de>
References: <20200404094101.672954-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 amd-gfx@lists.freedesktop.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-usb@vger.kernel.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
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

No Xen support anywhere here.  Remove a dead declaration and an unused
include.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.c       | 1 -
 drivers/gpu/drm/i915/gvt/hypercall.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 9e1787867894..c7c561237883 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -31,7 +31,6 @@
  */
 
 #include <linux/types.h>
-#include <xen/xen.h>
 #include <linux/kthread.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index b17c4a1599cd..b79da5124f83 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -79,6 +79,4 @@ struct intel_gvt_mpt {
 	bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);
 };
 
-extern struct intel_gvt_mpt xengt_mpt;
-
 #endif /* _GVT_HYPERCALL_H_ */
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
