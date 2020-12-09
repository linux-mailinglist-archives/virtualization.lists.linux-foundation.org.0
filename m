Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 562B22D441F
	for <lists.virtualization@lfdr.de>; Wed,  9 Dec 2020 15:25:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 374F187A3D;
	Wed,  9 Dec 2020 14:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rnqZXq8ChgEM; Wed,  9 Dec 2020 14:25:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 224C587A36;
	Wed,  9 Dec 2020 14:25:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09E68C0FA7;
	Wed,  9 Dec 2020 14:25:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17706C013B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 03912872D0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajNaOFkXQTId
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1778687A16
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE327ACEB;
 Wed,  9 Dec 2020 14:25:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Subject: [PATCH v3 3/8] dma-buf: Add vmap_local and vnumap_local operations
Date: Wed,  9 Dec 2020 15:25:22 +0100
Message-Id: <20201209142527.26415-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
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

The existing dma-buf calls dma_buf_vmap() and dma_buf_vunmap() are
allowed to pin the buffer or acquire the buffer's reservation object
lock.

This is a problem for callers that only require a short-term mapping
of the buffer without the pinning, or callers that have special locking
requirements. These may suffer from unnecessary overhead or interfere
with regular pin operations.

The new interfaces dma_buf_vmap_local(), dma_buf_vunmapo_local(), and
their rsp callbacks in struct dma_buf_ops provide an alternative without
pinning or reservation locking. Callers are responsible for these
operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/dma-buf/dma-buf.c | 80 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   | 34 +++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e63684d4cd90..be9f80190a66 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1265,6 +1265,86 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
+/**
+ * dma_buf_vmap_local - Create virtual mapping for the buffer object into kernel
+ * address space.
+ * @dmabuf:	[in]	buffer to vmap
+ * @map:	[out]	returns the vmap pointer
+ *
+ * This call may fail due to lack of virtual mapping address space.
+ * These calls are optional in drivers. The intended use for them
+ * is for mapping objects linear in kernel space for high use objects.
+ * Please attempt to use kmap/kunmap before thinking about these interfaces.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map)
+{
+	struct dma_buf_map ptr;
+	int ret = 0;
+
+	dma_buf_map_clear(map);
+
+	if (WARN_ON(!dmabuf))
+		return -EINVAL;
+
+	dma_resv_assert_held(dmabuf->resv);
+
+	if (!dmabuf->ops->vmap_local)
+		return -EINVAL;
+
+	mutex_lock(&dmabuf->lock);
+	if (dmabuf->vmapping_counter) {
+		dmabuf->vmapping_counter++;
+		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
+		*map = dmabuf->vmap_ptr;
+		goto out_unlock;
+	}
+
+	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
+
+	ret = dmabuf->ops->vmap_local(dmabuf, &ptr);
+	if (WARN_ON_ONCE(ret))
+		goto out_unlock;
+
+	dmabuf->vmap_ptr = ptr;
+	dmabuf->vmapping_counter = 1;
+
+	*map = dmabuf->vmap_ptr;
+
+out_unlock:
+	mutex_unlock(&dmabuf->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dma_buf_vmap_local);
+
+/**
+ * dma_buf_vunmap_local - Unmap a vmap obtained by dma_buf_vmap_local.
+ * @dmabuf:	[in]	buffer to vunmap
+ * @map:	[in]	vmap pointer to vunmap
+ */
+void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map)
+{
+	if (WARN_ON(!dmabuf))
+		return;
+
+	dma_resv_assert_held(dmabuf->resv);
+
+	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
+	BUG_ON(dmabuf->vmapping_counter == 0);
+	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
+
+	mutex_lock(&dmabuf->lock);
+	if (--dmabuf->vmapping_counter == 0) {
+		if (dmabuf->ops->vunmap_local)
+			dmabuf->ops->vunmap_local(dmabuf, map);
+		dma_buf_map_clear(&dmabuf->vmap_ptr);
+	}
+	mutex_unlock(&dmabuf->lock);
+}
+EXPORT_SYMBOL_GPL(dma_buf_vunmap_local);
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index cf72699cb2bc..f66580d23a9b 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -269,6 +269,38 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
+
+	/**
+	 * @vmap_local:
+	 *
+	 * Creates a virtual mapping for the buffer into kernel address space.
+	 *
+	 * This callback establishes short-term mappings for situations where
+	 * callers only use the buffer for a bounded amount of time; such as
+	 * updates to the framebuffer or reading back contained information.
+	 * In contrast to the regular @vmap callback, vmap_local does never pin
+	 * the buffer to a specific domain or acquire the buffer's reservation
+	 * lock.
+	 *
+	 * This is called with the dmabuf->resv object locked. Callers must hold
+	 * the lock until after removing the mapping with @vunmap_local.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure.
+	 */
+	int (*vmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
+
+	/**
+	 * @vunmap_local:
+	 *
+	 * Removes a virtual mapping that wa sestablished by @vmap_local.
+	 *
+	 * This callback is optional.
+	 */
+	void (*vunmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 };
 
 /**
@@ -506,4 +538,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
+int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map);
+void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map);
 #endif /* __DMA_BUF_H__ */
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
