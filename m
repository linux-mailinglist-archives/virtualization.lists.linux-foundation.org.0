Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9275AEE9
	for <lists.virtualization@lfdr.de>; Sun, 30 Jun 2019 08:20:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6973EB65;
	Sun, 30 Jun 2019 06:19:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 45EEAACC
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 06:19:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E3E56A8
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 06:19:56 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id d11so6608222lfb.4
	for <virtualization@lists.linux-foundation.org>;
	Sat, 29 Jun 2019 23:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aj1rn6R3h1bFa9Q74iphPEKExJXGPK2dhno0nQoTEUY=;
	b=Jxz/2dDDBFWUj9WaiPTxuujAVYNbn9z7aKj3/qjWxUcJ/k0TDz47bl0apj+q+ZP5JU
	9Xq9U3gajRjejUk+MV0DYzu/oUlaPNDpzZT4xNsNfSVu8HyvLktogLv6mdCuMKbiU3tN
	O4cvipF1MaNa6TqCL1qZUVRceGa/rV4K7SiGB4nyTdALEI0q6kPsM1tR/+OgGVAl+1hu
	TJU2uTVtg0XbaRepgpU1MQyOcZM/Fb4bSGclZqCfEbdZJQs8//3jg8L7fCjzBNr8lpIH
	qEA68vbOfml1MNgiUUHrQNoRVcXOgbh5nR0SZOZvAhpDCEpkHQRPhHyduSn5lMC+RqHD
	ffJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=aj1rn6R3h1bFa9Q74iphPEKExJXGPK2dhno0nQoTEUY=;
	b=Z70U5uZyDIQ+PBrcKG/cDrksMRFSNgbe09tUwacWsG2S5ewODJ6wI+3OqkPaS1FX/J
	mqpUn7zZ31q6Tom0e87B37lp8LGxSAnNiOQGVV6JupC/J0QciKDbhFn+qYu2EppvYH/c
	BURX86GsYatqFDT4s6qbf+1rh0Yf1/xvaoWlmcbibBgyqt8uChHocg3hyzWwybScFqrm
	9EUHVrLe3By4nJ9k18o2glUsB1yIqOqesE4hI/eC5ZuznNDfa28g+C5EcYb/pqAg9tR5
	5VjSQRiZW+bKGs99uVvXadIcqNBvmJYw1OifAe/3mthqp0N6Ok2FuSjQIvq/ZbeLfFDY
	Rzmg==
X-Gm-Message-State: APjAAAW5nytaYPJig/3ipq1rm2jZKQ4xgXTAfnA4VCVCFaXp05GUPEDb
	yCmzQ8s1NAFZmkA4L/G+iAo=
X-Google-Smtp-Source: APXvYqw/iC64nDysIw+BfRx1Cr3OS1ZZK3PWqXJedAWsyXTrkznakE326EDMmf5NebUrqAW/16SP8g==
X-Received: by 2002:ac2:51ab:: with SMTP id f11mr4345585lfk.55.1561875595359; 
	Sat, 29 Jun 2019 23:19:55 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
	by smtp.gmail.com with ESMTPSA id
	o74sm1794024lff.46.2019.06.29.23.19.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 23:19:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 27/33] drm/virtgpu: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:16 +0200
Message-Id: <20190630061922.7254-28-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
	Daniel Vetter <daniel@ffwll.ch>, virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Drop use of the deprecated drmP.h header file.
Fix fallout by adding missing include files.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
---
The list of cc: was too large to add all recipients to the cover letter.
Please find cover letter here:
https://lists.freedesktop.org/archives/dri-devel/2019-June/thread.html
Search for "drm: drop use of drmp.h in drm-misc"

        Sam

 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_display.c |  7 +++++--
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  5 ++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 +++---
 drivers/gpu/drm/virtio/virtgpu_fence.c   |  2 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c     |  4 +++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  8 +++++---
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  4 +++-
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  6 ++++--
 drivers/gpu/drm/virtio/virtgpu_prime.c   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_ttm.c     | 13 +++++++------
 drivers/gpu/drm/virtio/virtgpu_vq.c      |  7 ++++---
 12 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index ed0fcda713c3..5156e6b279db 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -23,8 +23,8 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <linux/debugfs.h>
-#include <drm/drmP.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ba16e8cb7124..e622485ae826 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -25,11 +25,14 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include "virtgpu_drv.h"
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_damage_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "virtgpu_drv.h"
 
 #define XRES_MIN    32
 #define YRES_MIN    32
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 99bcd290f1fb..0fc32fa0b3c0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -29,10 +29,13 @@
 #include <linux/module.h>
 #include <linux/console.h>
 #include <linux/pci.h>
-#include <drm/drmP.h>
+
 #include <drm/drm.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 
 #include "virtgpu_drv.h"
+
 static struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9e2d3062b01d..f4ecea6054ba 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -31,16 +31,16 @@
 #include <linux/virtio_config.h>
 #include <linux/virtio_gpu.h>
 
-#include <drm/drmP.h>
-#include <drm/drm_gem.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_module.h>
+#include <drm/ttm/ttm_placement.h>
 
 #define DRIVER_NAME "virtio_gpu"
 #define DRIVER_DESC "virtio GPU"
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 70d6c4329778..a0514f5bd006 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -23,8 +23,8 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drmP.h>
 #include <trace/events/dma_fence.h>
+
 #include "virtgpu_drv.h"
 
 static const char *virtio_get_driver_name(struct dma_fence *f)
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 1e49e08dd545..292566146814 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -23,7 +23,9 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drmP.h>
+#include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
+
 #include "virtgpu_drv.h"
 
 void virtio_gpu_gem_free_object(struct drm_gem_object *gem_obj)
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 1b50c34a29dc..d379d2e7e3ef 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -25,11 +25,13 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drmP.h>
-#include <drm/virtgpu_drm.h>
-#include <drm/ttm/ttm_execbuf_util.h>
+#include <linux/file.h>
 #include <linux/sync_file.h>
 
+#include <drm/drm_file.h>
+#include <drm/ttm/ttm_execbuf_util.h>
+#include <drm/virtgpu_drm.h>
+
 #include "virtgpu_drv.h"
 
 static void convert_to_hw_box(struct virtio_gpu_box *dst,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 84b6a6bf00c6..c190702fab72 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -25,7 +25,9 @@
 
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
-#include <drm/drmP.h>
+
+#include <drm/drm_file.h>
+
 #include "virtgpu_drv.h"
 
 static void virtio_gpu_config_changed_work_func(struct work_struct *work)
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 024c2aa0c929..f96c8296307e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -23,9 +23,11 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include "virtgpu_drv.h"
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_plane_helper.h>
+
+#include "virtgpu_drv.h"
 
 static const uint32_t virtio_gpu_formats[] = {
 	DRM_FORMAT_HOST_XRGB8888,
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 8fbf71bd0c5e..8b3b2caf3364 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -22,6 +22,8 @@
  * Authors: Andreas Pokorny
  */
 
+#include <drm/drm_prime.h>
+
 #include "virtgpu_drv.h"
 
 /* Empty Implementations as there should not be any other driver for a virtual
diff --git a/drivers/gpu/drm/virtio/virtgpu_ttm.c b/drivers/gpu/drm/virtio/virtgpu_ttm.c
index 300ef3a83538..f87903641847 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ttm.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ttm.c
@@ -25,17 +25,18 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/delay.h>
+
+#include <drm/drm.h>
+#include <drm/drm_file.h>
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_page_alloc.h>
 #include <drm/ttm/ttm_module.h>
-#include <drm/drmP.h>
-#include <drm/drm.h>
+#include <drm/ttm/ttm_page_alloc.h>
+#include <drm/ttm/ttm_placement.h>
 #include <drm/virtgpu_drm.h>
-#include "virtgpu_drv.h"
 
-#include <linux/delay.h>
+#include "virtgpu_drv.h"
 
 static struct
 virtio_gpu_device *virtio_gpu_get_vgdev(struct ttm_bo_device *bdev)
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 6c1a90717535..94af12357e70 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -26,13 +26,14 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drmP.h>
-#include "virtgpu_drv.h"
-#include "virtgpu_trace.h"
+#include <linux/dma-mapping.h>
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ring.h>
 
+#include "virtgpu_drv.h"
+#include "virtgpu_trace.h"
+
 #define MAX_INLINE_CMD_SIZE   96
 #define MAX_INLINE_RESP_SIZE  24
 #define VBUFFER_SIZE          (sizeof(struct virtio_gpu_vbuffer) \
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
