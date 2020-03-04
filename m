Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D5178C12
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 09:01:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D996986416;
	Wed,  4 Mar 2020 08:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8oiNdaubov9; Wed,  4 Mar 2020 08:01:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 03BDC86614;
	Wed,  4 Mar 2020 08:01:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE720C013E;
	Wed,  4 Mar 2020 08:01:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98B05C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 08:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 87A5686569
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 08:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id es08ExPAXDtH
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 08:01:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 429D881DD2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583308890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zRcprHlNKHf2Y4uTuJshwgaM2L8IjHdUUjSNLW2L6Ws=;
 b=bPwA8DVqIel19xIFS+Lv+tYYa3kWiC8Wg2rvyRBuIAevGcB24yAEQvFpIawPMFgIiCxccu
 BBqYLyxBz3HrNIkqegElhvCZBIJWsso/oxCfMeiaAwYG3ckzaoJfZstUXCjGNSqxvIJGGT
 ofIhqOAxfQyHVSkDefKbIaZh1H/OA7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-7VMskJu9NeKxqy4Gs6rfng-1; Wed, 04 Mar 2020 03:01:26 -0500
X-MC-Unique: 7VMskJu9NeKxqy4Gs6rfng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8551801E5C;
 Wed,  4 Mar 2020 08:01:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B825D1BC6D;
 Wed,  4 Mar 2020 08:01:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0266617506; Wed,  4 Mar 2020 09:01:20 +0100 (CET)
Date: Wed, 4 Mar 2020 09:01:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v2 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200304080119.i55opxkhk4kdt4hp@sirius.home.kraxel.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
 <20200302121524.7543-5-stevensd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302121524.7543-5-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
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

  Hi,

> +	if (vgdev->has_resource_assign_uuid) {
> +		spin_lock(&vgdev->resource_export_lock);
> +		if (bo->uuid_state == UUID_NOT_INITIALIZED) {
> +			bo->uuid_state = UUID_INITIALIZING;
> +			needs_init = true;
> +		}
> +		spin_unlock(&vgdev->resource_export_lock);
> +
> +		if (needs_init) {
> +			ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, bo);

You can submit a fenced command, then wait on the fence here.  Removes
the need for UUID_INITIALIZING.

Also note that this function will be called only once, on the first
export.  When exporting the same object again drm will simply reuse
the existing dmabuf.  You can drop UUID_NOT_INITIALIZED and needs_init.

So you are left with only two uuid_state states.  You could turn uuid
into a pointer, so it gets only allocated when needed.  Also uuid ==
NULL can be used for "uuid not available" then.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
