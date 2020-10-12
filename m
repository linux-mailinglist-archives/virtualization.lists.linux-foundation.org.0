Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0223C28BEE9
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 19:18:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2EBB321FA9;
	Mon, 12 Oct 2020 17:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xv9Q01kfaoZX; Mon, 12 Oct 2020 17:18:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1DE0522640;
	Mon, 12 Oct 2020 17:18:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8633C0051;
	Mon, 12 Oct 2020 17:18:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D908BC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 17:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CFA0122011
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 17:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xs1ccksJUis4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 17:18:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id 6F95321FA9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 17:18:32 +0000 (UTC)
IronPort-SDR: nDTDojIEbCh9nEhpuP602tutXZVRcAs9a2hQ/OX2rdGnIhBM2L2A71JQ3JCb3QlHa98hEHBowx
 b/W2QlN8UOsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="229955070"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="229955070"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 10:18:30 -0700
IronPort-SDR: lsFj37p4SAL7n7qYiHHHh0pA/ZSrgBZK1bE7Yc6P7IrI/T6H3qG/TMDBZ9kaIEzfZ+GDUR+QAH
 pzsXbRRHTj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="355862760"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Oct 2020 10:18:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3E494163; Mon, 12 Oct 2020 20:18:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Stevens <stevensd@chromium.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v1] drm/virtio: Use UUID API for importing the UUID
Date: Mon, 12 Oct 2020 20:18:26 +0300
Message-Id: <20201012171826.76509-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

There is import_uuid() function which imports u8 array to the uuid_t.
Use it instead of open coding variant.

This allows to hide the uuid_t internals.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 07945ca238e2..8944cc0bf8eb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1129,7 +1129,7 @@ static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
 
 	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
 	    obj->uuid_state == UUID_INITIALIZING) {
-		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
+		import_uuid(&obj->uuid, resp->uuid);
 		obj->uuid_state = UUID_INITIALIZED;
 	} else {
 		obj->uuid_state = UUID_INITIALIZATION_FAILED;
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
