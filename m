Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A01261CC
	for <lists.virtualization@lfdr.de>; Wed, 22 May 2019 12:33:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E4216B09;
	Wed, 22 May 2019 10:33:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EFF01AA5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 10:33:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B6DBA6C5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 10:33:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 401AB309267F;
	Wed, 22 May 2019 10:33:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E52782855E;
	Wed, 22 May 2019 10:33:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C46F7A1E7; Wed, 22 May 2019 12:33:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/cirrus: remove leftover files
Date: Wed, 22 May 2019 12:33:07 +0200
Message-Id: <20190522103307.12711-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 22 May 2019 10:33:18 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

cirrus_drv.h and cirrus_ttm.c are unused since commit ab3e023b1b4c
("drm/cirrus: rewrite and modernize driver"), apparently I ran "rm"
instead of "git rm" on them so they are still in present the tree.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/cirrus/cirrus_drv.h | 250 ---------------------
 drivers/gpu/drm/cirrus/cirrus_ttm.c | 337 ----------------------------
 2 files changed, 587 deletions(-)
 delete mode 100644 drivers/gpu/drm/cirrus/cirrus_drv.h
 delete mode 100644 drivers/gpu/drm/cirrus/cirrus_ttm.c

diff --git a/drivers/gpu/drm/cirrus/cirrus_drv.h b/drivers/gpu/drm/cirrus/cirrus_drv.h
deleted file mode 100644
index 1bd816be3aae..000000000000
--- a/drivers/gpu/drm/cirrus/cirrus_drv.h
+++ /dev/null
@@ -1,250 +0,0 @@
-/*
- * Copyright 2012 Red Hat
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License version 2. See the file COPYING in the main
- * directory of this archive for more details.
- *
- * Authors: Matthew Garrett
- *          Dave Airlie
- */
-#ifndef __CIRRUS_DRV_H__
-#define __CIRRUS_DRV_H__
-
-#include <video/vga.h>
-
-#include <drm/drm_encoder.h>
-#include <drm/drm_fb_helper.h>
-
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_memory.h>
-#include <drm/ttm/ttm_module.h>
-
-#include <drm/drm_gem.h>
-
-#define DRIVER_AUTHOR		"Matthew Garrett"
-
-#define DRIVER_NAME		"cirrus"
-#define DRIVER_DESC		"qemu Cirrus emulation"
-#define DRIVER_DATE		"20110418"
-
-#define DRIVER_MAJOR		1
-#define DRIVER_MINOR		0
-#define DRIVER_PATCHLEVEL	0
-
-#define CIRRUSFB_CONN_LIMIT 1
-
-#define RREG8(reg) ioread8(((void __iomem *)cdev->rmmio) + (reg))
-#define WREG8(reg, v) iowrite8(v, ((void __iomem *)cdev->rmmio) + (reg))
-#define RREG32(reg) ioread32(((void __iomem *)cdev->rmmio) + (reg))
-#define WREG32(reg, v) iowrite32(v, ((void __iomem *)cdev->rmmio) + (reg))
-
-#define SEQ_INDEX 4
-#define SEQ_DATA 5
-
-#define WREG_SEQ(reg, v)					\
-	do {							\
-		WREG8(SEQ_INDEX, reg);				\
-		WREG8(SEQ_DATA, v);				\
-	} while (0)						\
-
-#define CRT_INDEX 0x14
-#define CRT_DATA 0x15
-
-#define WREG_CRT(reg, v)					\
-	do {							\
-		WREG8(CRT_INDEX, reg);				\
-		WREG8(CRT_DATA, v);				\
-	} while (0)						\
-
-#define GFX_INDEX 0xe
-#define GFX_DATA 0xf
-
-#define WREG_GFX(reg, v)					\
-	do {							\
-		WREG8(GFX_INDEX, reg);				\
-		WREG8(GFX_DATA, v);				\
-	} while (0)						\
-
-/*
- * Cirrus has a "hidden" DAC register that can be accessed by writing to
- * the pixel mask register to reset the state, then reading from the register
- * four times. The next write will then pass to the DAC
- */
-#define VGA_DAC_MASK 0x6
-
-#define WREG_HDR(v)						\
-	do {							\
-		RREG8(VGA_DAC_MASK);					\
-		RREG8(VGA_DAC_MASK);					\
-		RREG8(VGA_DAC_MASK);					\
-		RREG8(VGA_DAC_MASK);					\
-		WREG8(VGA_DAC_MASK, v);					\
-	} while (0)						\
-
-
-#define CIRRUS_MAX_FB_HEIGHT 4096
-#define CIRRUS_MAX_FB_WIDTH 4096
-
-#define CIRRUS_DPMS_CLEARED (-1)
-
-#define to_cirrus_crtc(x) container_of(x, struct cirrus_crtc, base)
-#define to_cirrus_encoder(x) container_of(x, struct cirrus_encoder, base)
-
-struct cirrus_crtc {
-	struct drm_crtc			base;
-	int				last_dpms;
-	bool				enabled;
-};
-
-struct cirrus_fbdev;
-struct cirrus_mode_info {
-	struct cirrus_crtc		*crtc;
-	/* pointer to fbdev info structure */
-	struct cirrus_fbdev		*gfbdev;
-};
-
-struct cirrus_encoder {
-	struct drm_encoder		base;
-	int				last_dpms;
-};
-
-struct cirrus_connector {
-	struct drm_connector		base;
-};
-
-struct cirrus_mc {
-	resource_size_t			vram_size;
-	resource_size_t			vram_base;
-};
-
-struct cirrus_device {
-	struct drm_device		*dev;
-	unsigned long			flags;
-
-	resource_size_t			rmmio_base;
-	resource_size_t			rmmio_size;
-	void __iomem			*rmmio;
-
-	struct cirrus_mc			mc;
-	struct cirrus_mode_info		mode_info;
-
-	int				num_crtc;
-	int fb_mtrr;
-
-	struct {
-		struct ttm_bo_device bdev;
-	} ttm;
-	bool mm_inited;
-};
-
-
-struct cirrus_fbdev {
-	struct drm_fb_helper helper; /* must be first */
-	struct drm_framebuffer *gfb;
-	void *sysram;
-	int size;
-	int x1, y1, x2, y2; /* dirty rect */
-	spinlock_t dirty_lock;
-};
-
-struct cirrus_bo {
-	struct ttm_buffer_object bo;
-	struct ttm_placement placement;
-	struct ttm_bo_kmap_obj kmap;
-	struct drm_gem_object gem;
-	struct ttm_place placements[3];
-	int pin_count;
-};
-#define gem_to_cirrus_bo(gobj) container_of((gobj), struct cirrus_bo, gem)
-
-static inline struct cirrus_bo *
-cirrus_bo(struct ttm_buffer_object *bo)
-{
-	return container_of(bo, struct cirrus_bo, bo);
-}
-
-
-#define to_cirrus_obj(x) container_of(x, struct cirrus_gem_object, base)
-
-				/* cirrus_main.c */
-int cirrus_device_init(struct cirrus_device *cdev,
-		      struct drm_device *ddev,
-		      struct pci_dev *pdev,
-		      uint32_t flags);
-void cirrus_device_fini(struct cirrus_device *cdev);
-void cirrus_gem_free_object(struct drm_gem_object *obj);
-int cirrus_dumb_mmap_offset(struct drm_file *file,
-			    struct drm_device *dev,
-			    uint32_t handle,
-			    uint64_t *offset);
-int cirrus_gem_create(struct drm_device *dev,
-		   u32 size, bool iskernel,
-		      struct drm_gem_object **obj);
-int cirrus_dumb_create(struct drm_file *file,
-		    struct drm_device *dev,
-		       struct drm_mode_create_dumb *args);
-
-int cirrus_framebuffer_init(struct drm_device *dev,
-			    struct drm_framebuffer *gfb,
-			    const struct drm_mode_fb_cmd2 *mode_cmd,
-			    struct drm_gem_object *obj);
-
-bool cirrus_check_framebuffer(struct cirrus_device *cdev, int width, int height,
-			      int bpp, int pitch);
-
-				/* cirrus_display.c */
-int cirrus_modeset_init(struct cirrus_device *cdev);
-void cirrus_modeset_fini(struct cirrus_device *cdev);
-
-				/* cirrus_fbdev.c */
-int cirrus_fbdev_init(struct cirrus_device *cdev);
-void cirrus_fbdev_fini(struct cirrus_device *cdev);
-
-
-
-				/* cirrus_irq.c */
-void cirrus_driver_irq_preinstall(struct drm_device *dev);
-int cirrus_driver_irq_postinstall(struct drm_device *dev);
-void cirrus_driver_irq_uninstall(struct drm_device *dev);
-irqreturn_t cirrus_driver_irq_handler(int irq, void *arg);
-
-				/* cirrus_kms.c */
-int cirrus_driver_load(struct drm_device *dev, unsigned long flags);
-void cirrus_driver_unload(struct drm_device *dev);
-extern struct drm_ioctl_desc cirrus_ioctls[];
-extern int cirrus_max_ioctl;
-
-int cirrus_mm_init(struct cirrus_device *cirrus);
-void cirrus_mm_fini(struct cirrus_device *cirrus);
-void cirrus_ttm_placement(struct cirrus_bo *bo, int domain);
-int cirrus_bo_create(struct drm_device *dev, int size, int align,
-		     uint32_t flags, struct cirrus_bo **pcirrusbo);
-int cirrus_mmap(struct file *filp, struct vm_area_struct *vma);
-
-static inline int cirrus_bo_reserve(struct cirrus_bo *bo, bool no_wait)
-{
-	int ret;
-
-	ret = ttm_bo_reserve(&bo->bo, true, no_wait, NULL);
-	if (ret) {
-		if (ret != -ERESTARTSYS && ret != -EBUSY)
-			DRM_ERROR("reserve failed %p\n", bo);
-		return ret;
-	}
-	return 0;
-}
-
-static inline void cirrus_bo_unreserve(struct cirrus_bo *bo)
-{
-	ttm_bo_unreserve(&bo->bo);
-}
-
-int cirrus_bo_push_sysram(struct cirrus_bo *bo);
-int cirrus_bo_pin(struct cirrus_bo *bo, u32 pl_flag, u64 *gpu_addr);
-
-extern int cirrus_bpp;
-
-#endif				/* __CIRRUS_DRV_H__ */
diff --git a/drivers/gpu/drm/cirrus/cirrus_ttm.c b/drivers/gpu/drm/cirrus/cirrus_ttm.c
deleted file mode 100644
index e6b98467a428..000000000000
--- a/drivers/gpu/drm/cirrus/cirrus_ttm.c
+++ /dev/null
@@ -1,337 +0,0 @@
-/*
- * Copyright 2012 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- */
-/*
- * Authors: Dave Airlie <airlied@redhat.com>
- */
-#include <drm/drmP.h>
-#include <drm/ttm/ttm_page_alloc.h>
-
-#include "cirrus_drv.h"
-
-static inline struct cirrus_device *
-cirrus_bdev(struct ttm_bo_device *bd)
-{
-	return container_of(bd, struct cirrus_device, ttm.bdev);
-}
-
-static void cirrus_bo_ttm_destroy(struct ttm_buffer_object *tbo)
-{
-	struct cirrus_bo *bo;
-
-	bo = container_of(tbo, struct cirrus_bo, bo);
-
-	drm_gem_object_release(&bo->gem);
-	kfree(bo);
-}
-
-static bool cirrus_ttm_bo_is_cirrus_bo(struct ttm_buffer_object *bo)
-{
-	if (bo->destroy == &cirrus_bo_ttm_destroy)
-		return true;
-	return false;
-}
-
-static int
-cirrus_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
-		     struct ttm_mem_type_manager *man)
-{
-	switch (type) {
-	case TTM_PL_SYSTEM:
-		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_MASK_CACHING;
-		man->default_caching = TTM_PL_FLAG_CACHED;
-		break;
-	case TTM_PL_VRAM:
-		man->func = &ttm_bo_manager_func;
-		man->flags = TTM_MEMTYPE_FLAG_FIXED |
-			TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_FLAG_UNCACHED |
-			TTM_PL_FLAG_WC;
-		man->default_caching = TTM_PL_FLAG_WC;
-		break;
-	default:
-		DRM_ERROR("Unsupported memory type %u\n", (unsigned)type);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static void
-cirrus_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
-{
-	struct cirrus_bo *cirrusbo = cirrus_bo(bo);
-
-	if (!cirrus_ttm_bo_is_cirrus_bo(bo))
-		return;
-
-	cirrus_ttm_placement(cirrusbo, TTM_PL_FLAG_SYSTEM);
-	*pl = cirrusbo->placement;
-}
-
-static int cirrus_bo_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct cirrus_bo *cirrusbo = cirrus_bo(bo);
-
-	return drm_vma_node_verify_access(&cirrusbo->gem.vma_node,
-					  filp->private_data);
-}
-
-static int cirrus_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-				  struct ttm_mem_reg *mem)
-{
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
-	struct cirrus_device *cirrus = cirrus_bdev(bdev);
-
-	mem->bus.addr = NULL;
-	mem->bus.offset = 0;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-	mem->bus.base = 0;
-	mem->bus.is_iomem = false;
-	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
-		return -EINVAL;
-	switch (mem->mem_type) {
-	case TTM_PL_SYSTEM:
-		/* system memory */
-		return 0;
-	case TTM_PL_VRAM:
-		mem->bus.offset = mem->start << PAGE_SHIFT;
-		mem->bus.base = pci_resource_start(cirrus->dev->pdev, 0);
-		mem->bus.is_iomem = true;
-		break;
-	default:
-		return -EINVAL;
-		break;
-	}
-	return 0;
-}
-
-static void cirrus_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
-{
-}
-
-static void cirrus_ttm_backend_destroy(struct ttm_tt *tt)
-{
-	ttm_tt_fini(tt);
-	kfree(tt);
-}
-
-static struct ttm_backend_func cirrus_tt_backend_func = {
-	.destroy = &cirrus_ttm_backend_destroy,
-};
-
-
-static struct ttm_tt *cirrus_ttm_tt_create(struct ttm_buffer_object *bo,
-					   uint32_t page_flags)
-{
-	struct ttm_tt *tt;
-
-	tt = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
-	if (tt == NULL)
-		return NULL;
-	tt->func = &cirrus_tt_backend_func;
-	if (ttm_tt_init(tt, bo, page_flags)) {
-		kfree(tt);
-		return NULL;
-	}
-	return tt;
-}
-
-struct ttm_bo_driver cirrus_bo_driver = {
-	.ttm_tt_create = cirrus_ttm_tt_create,
-	.init_mem_type = cirrus_bo_init_mem_type,
-	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = cirrus_bo_evict_flags,
-	.move = NULL,
-	.verify_access = cirrus_bo_verify_access,
-	.io_mem_reserve = &cirrus_ttm_io_mem_reserve,
-	.io_mem_free = &cirrus_ttm_io_mem_free,
-};
-
-int cirrus_mm_init(struct cirrus_device *cirrus)
-{
-	int ret;
-	struct drm_device *dev = cirrus->dev;
-	struct ttm_bo_device *bdev = &cirrus->ttm.bdev;
-
-	ret = ttm_bo_device_init(&cirrus->ttm.bdev,
-				 &cirrus_bo_driver,
-				 dev->anon_inode->i_mapping,
-				 true);
-	if (ret) {
-		DRM_ERROR("Error initialising bo driver; %d\n", ret);
-		return ret;
-	}
-
-	ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM,
-			     cirrus->mc.vram_size >> PAGE_SHIFT);
-	if (ret) {
-		DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
-		return ret;
-	}
-
-	arch_io_reserve_memtype_wc(pci_resource_start(dev->pdev, 0),
-				   pci_resource_len(dev->pdev, 0));
-
-	cirrus->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
-					   pci_resource_len(dev->pdev, 0));
-
-	cirrus->mm_inited = true;
-	return 0;
-}
-
-void cirrus_mm_fini(struct cirrus_device *cirrus)
-{
-	struct drm_device *dev = cirrus->dev;
-
-	if (!cirrus->mm_inited)
-		return;
-
-	ttm_bo_device_release(&cirrus->ttm.bdev);
-
-	arch_phys_wc_del(cirrus->fb_mtrr);
-	cirrus->fb_mtrr = 0;
-	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
-				pci_resource_len(dev->pdev, 0));
-}
-
-void cirrus_ttm_placement(struct cirrus_bo *bo, int domain)
-{
-	u32 c = 0;
-	unsigned i;
-	bo->placement.placement = bo->placements;
-	bo->placement.busy_placement = bo->placements;
-	if (domain & TTM_PL_FLAG_VRAM)
-		bo->placements[c++].flags = TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;
-	if (domain & TTM_PL_FLAG_SYSTEM)
-		bo->placements[c++].flags = TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
-	if (!c)
-		bo->placements[c++].flags = TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
-	bo->placement.num_placement = c;
-	bo->placement.num_busy_placement = c;
-	for (i = 0; i < c; ++i) {
-		bo->placements[i].fpfn = 0;
-		bo->placements[i].lpfn = 0;
-	}
-}
-
-int cirrus_bo_create(struct drm_device *dev, int size, int align,
-		  uint32_t flags, struct cirrus_bo **pcirrusbo)
-{
-	struct cirrus_device *cirrus = dev->dev_private;
-	struct cirrus_bo *cirrusbo;
-	size_t acc_size;
-	int ret;
-
-	cirrusbo = kzalloc(sizeof(struct cirrus_bo), GFP_KERNEL);
-	if (!cirrusbo)
-		return -ENOMEM;
-
-	ret = drm_gem_object_init(dev, &cirrusbo->gem, size);
-	if (ret) {
-		kfree(cirrusbo);
-		return ret;
-	}
-
-	cirrusbo->bo.bdev = &cirrus->ttm.bdev;
-
-	cirrus_ttm_placement(cirrusbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
-
-	acc_size = ttm_bo_dma_acc_size(&cirrus->ttm.bdev, size,
-				       sizeof(struct cirrus_bo));
-
-	ret = ttm_bo_init(&cirrus->ttm.bdev, &cirrusbo->bo, size,
-			  ttm_bo_type_device, &cirrusbo->placement,
-			  align >> PAGE_SHIFT, false, acc_size,
-			  NULL, NULL, cirrus_bo_ttm_destroy);
-	if (ret)
-		return ret;
-
-	*pcirrusbo = cirrusbo;
-	return 0;
-}
-
-static inline u64 cirrus_bo_gpu_offset(struct cirrus_bo *bo)
-{
-	return bo->bo.offset;
-}
-
-int cirrus_bo_pin(struct cirrus_bo *bo, u32 pl_flag, u64 *gpu_addr)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-
-	if (bo->pin_count) {
-		bo->pin_count++;
-		if (gpu_addr)
-			*gpu_addr = cirrus_bo_gpu_offset(bo);
-	}
-
-	cirrus_ttm_placement(bo, pl_flag);
-	for (i = 0; i < bo->placement.num_placement; i++)
-		bo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
-	ret = ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-	if (ret)
-		return ret;
-
-	bo->pin_count = 1;
-	if (gpu_addr)
-		*gpu_addr = cirrus_bo_gpu_offset(bo);
-	return 0;
-}
-
-int cirrus_bo_push_sysram(struct cirrus_bo *bo)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-	if (!bo->pin_count) {
-		DRM_ERROR("unpin bad %p\n", bo);
-		return 0;
-	}
-	bo->pin_count--;
-	if (bo->pin_count)
-		return 0;
-
-	if (bo->kmap.virtual)
-		ttm_bo_kunmap(&bo->kmap);
-
-	cirrus_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
-	for (i = 0; i < bo->placement.num_placement ; i++)
-		bo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
-
-	ret = ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-	if (ret) {
-		DRM_ERROR("pushing to VRAM failed\n");
-		return ret;
-	}
-	return 0;
-}
-
-int cirrus_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct cirrus_device *cirrus = file_priv->minor->dev->dev_private;
-
-	return ttm_bo_mmap(filp, vma, &cirrus->ttm.bdev);
-}
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
