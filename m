Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC1832D637
	for <lists.virtualization@lfdr.de>; Thu,  4 Mar 2021 16:14:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7E36840E3;
	Thu,  4 Mar 2021 15:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhLWfw6eX_V8; Thu,  4 Mar 2021 15:14:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5838B842CC;
	Thu,  4 Mar 2021 15:14:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E07C0C0001;
	Thu,  4 Mar 2021 15:14:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5C3BC000F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 15:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 883386F840
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 15:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="chmwnZQK";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="oQztf/0R"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kyoTikIBKO9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 15:14:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ED866F558
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 15:14:16 +0000 (UTC)
Message-Id: <20210303132711.982307498@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614870852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=yu34YjnIEyOyfqoftcpNPw8TU3KSWyY89xmWxIGGep0=;
 b=chmwnZQKb5D/CyT40zo//PeCWkbQq4sZX3P81oGa1TA5y/Y1/eQW/WdMO/VE7YAmZLxR+E
 4ISiuYVdI/Bm+151Nj7bgVB4khgxKotITwm3qoqDjJto2+LBO/ZX4fVKpk9LUaYSPNQzvp
 ZDNEtN+VDeojHH2oQYxnuVFIOJlkL59fPMSp0lJIDsKueuR9JsYavEmG1sA8Qh+3s2Wkiv
 A0UtARr7st+Fw8HI3Jl5TgyD9SmkAp0Oo6q9s2H54g+t89F7+2t/C7ixKOFKik8ceLy/od
 GXkWACpSk9qaFk6SWfHqmw7B66SlrwA3PMz02/HZ3Q3xFSGsSM/XR81tkkWUwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614870852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=yu34YjnIEyOyfqoftcpNPw8TU3KSWyY89xmWxIGGep0=;
 b=oQztf/0RVI2avMzXgiQF+z+XX3Cp+a3u3ZVfKmq2tsgbIrWCc7WtT2UobyCvmD2tVI+fiZ
 6ArXbSvj9hPd2DBw==
Date: Wed, 03 Mar 2021 14:20:29 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 6/7] drm/i915: Replace io_mapping_map_atomic_wc()
References: <20210303132023.077167457@linutronix.de>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Christian Koenig <christian.koenig@amd.com>, Zack Rusin <zackr@vmware.com>
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

From: Thomas Gleixner <tglx@linutronix.de>

None of these mapping requires the side effect of disabling pagefaults and
preemption.

Use io_mapping_map_local_wc() instead, and clean up gtt_user_read() and
gtt_user_write() to use a plain copy_from_user() as the local maps are not
disabling pagefaults.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |    7 +---
 drivers/gpu/drm/i915/i915_gem.c                |   40 ++++++++-----------------
 drivers/gpu/drm/i915/selftests/i915_gem.c      |    4 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c  |    8 ++---
 4 files changed, 22 insertions(+), 37 deletions(-)

--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1080,7 +1080,7 @@ static void reloc_cache_reset(struct rel
 		struct i915_ggtt *ggtt = cache_to_ggtt(cache);
 
 		intel_gt_flush_ggtt_writes(ggtt->vm.gt);
-		io_mapping_unmap_atomic((void __iomem *)vaddr);
+		io_mapping_unmap_local((void __iomem *)vaddr);
 
 		if (drm_mm_node_allocated(&cache->node)) {
 			ggtt->vm.clear_range(&ggtt->vm,
@@ -1146,7 +1146,7 @@ static void *reloc_iomap(struct drm_i915
 
 	if (cache->vaddr) {
 		intel_gt_flush_ggtt_writes(ggtt->vm.gt);
-		io_mapping_unmap_atomic((void __force __iomem *) unmask_page(cache->vaddr));
+		io_mapping_unmap_local((void __force __iomem *) unmask_page(cache->vaddr));
 	} else {
 		struct i915_vma *vma;
 		int err;
@@ -1194,8 +1194,7 @@ static void *reloc_iomap(struct drm_i915
 		offset += page << PAGE_SHIFT;
 	}
 
-	vaddr = (void __force *)io_mapping_map_atomic_wc(&ggtt->iomap,
-							 offset);
+	vaddr = (void __force *)io_mapping_map_local_wc(&ggtt->iomap, offset);
 	cache->page = page;
 	cache->vaddr = (unsigned long)vaddr;
 
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -253,22 +253,15 @@ gtt_user_read(struct io_mapping *mapping
 	      char __user *user_data, int length)
 {
 	void __iomem *vaddr;
-	unsigned long unwritten;
+	bool fail = false;
 
 	/* We can use the cpu mem copy function because this is X86. */
-	vaddr = io_mapping_map_atomic_wc(mapping, base);
-	unwritten = __copy_to_user_inatomic(user_data,
-					    (void __force *)vaddr + offset,
-					    length);
-	io_mapping_unmap_atomic(vaddr);
-	if (unwritten) {
-		vaddr = io_mapping_map_wc(mapping, base, PAGE_SIZE);
-		unwritten = copy_to_user(user_data,
-					 (void __force *)vaddr + offset,
-					 length);
-		io_mapping_unmap(vaddr);
-	}
-	return unwritten;
+	vaddr = io_mapping_map_local_wc(mapping, base);
+	if (copy_to_user(user_data, (void __force *)vaddr + offset, length))
+		fail = true;
+	io_mapping_unmap_local(vaddr);
+
+	return fail;
 }
 
 static int
@@ -437,21 +430,14 @@ ggtt_write(struct io_mapping *mapping,
 	   char __user *user_data, int length)
 {
 	void __iomem *vaddr;
-	unsigned long unwritten;
+	bool fail = false;
 
 	/* We can use the cpu mem copy function because this is X86. */
-	vaddr = io_mapping_map_atomic_wc(mapping, base);
-	unwritten = __copy_from_user_inatomic_nocache((void __force *)vaddr + offset,
-						      user_data, length);
-	io_mapping_unmap_atomic(vaddr);
-	if (unwritten) {
-		vaddr = io_mapping_map_wc(mapping, base, PAGE_SIZE);
-		unwritten = copy_from_user((void __force *)vaddr + offset,
-					   user_data, length);
-		io_mapping_unmap(vaddr);
-	}
-
-	return unwritten;
+	vaddr = io_mapping_map_local_wc(mapping, base);
+	if (copy_from_user((void __force *)vaddr + offset, user_data, length))
+		fail = true;
+	io_mapping_unmap_local(vaddr);
+	return fail;
 }
 
 /**
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -58,12 +58,12 @@ static void trash_stolen(struct drm_i915
 
 		ggtt->vm.insert_page(&ggtt->vm, dma, slot, I915_CACHE_NONE, 0);
 
-		s = io_mapping_map_atomic_wc(&ggtt->iomap, slot);
+		s = io_mapping_map_local_wc(&ggtt->iomap, slot);
 		for (x = 0; x < PAGE_SIZE / sizeof(u32); x++) {
 			prng = next_pseudo_random32(prng);
 			iowrite32(prng, &s[x]);
 		}
-		io_mapping_unmap_atomic(s);
+		io_mapping_unmap_local(s);
 	}
 
 	ggtt->vm.clear_range(&ggtt->vm, slot, PAGE_SIZE);
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1201,9 +1201,9 @@ static int igt_ggtt_page(void *arg)
 		u64 offset = tmp.start + order[n] * PAGE_SIZE;
 		u32 __iomem *vaddr;
 
-		vaddr = io_mapping_map_atomic_wc(&ggtt->iomap, offset);
+		vaddr = io_mapping_map_local_wc(&ggtt->iomap, offset);
 		iowrite32(n, vaddr + n);
-		io_mapping_unmap_atomic(vaddr);
+		io_mapping_unmap_local(vaddr);
 	}
 	intel_gt_flush_ggtt_writes(ggtt->vm.gt);
 
@@ -1213,9 +1213,9 @@ static int igt_ggtt_page(void *arg)
 		u32 __iomem *vaddr;
 		u32 val;
 
-		vaddr = io_mapping_map_atomic_wc(&ggtt->iomap, offset);
+		vaddr = io_mapping_map_local_wc(&ggtt->iomap, offset);
 		val = ioread32(vaddr + n);
-		io_mapping_unmap_atomic(vaddr);
+		io_mapping_unmap_local(vaddr);
 
 		if (val != n) {
 			pr_err("insert page failed: found %d, expected %d\n",

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
