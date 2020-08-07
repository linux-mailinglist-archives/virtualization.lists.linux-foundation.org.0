Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0E23ECFF
	for <lists.virtualization@lfdr.de>; Fri,  7 Aug 2020 13:57:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DCF7024FA8;
	Fri,  7 Aug 2020 11:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lWck31rI3DN; Fri,  7 Aug 2020 11:57:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1935B203E7;
	Fri,  7 Aug 2020 11:57:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEBD5C004C;
	Fri,  7 Aug 2020 11:57:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F94EC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 11:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 57BAD88934
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 11:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmydwWYEL80e
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 11:57:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8422C8892D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596801434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4OTRM6GItp3LnFcS/b/Uhe1XhDIzGwsKYalbI9Dy4T8=;
 b=ZezYuoq9ZkHjuM3ephqLWOo/GvHjsH1YFIrF1Y5mg8Z8GaQrBubx1C9/nBSdSAuJ/tJRad
 zJrEOzZcN7r8IRkj8ExxS6oqyfZLa/NvsOv4pvX6OGfe9zczzpxUmcaZNzAa+uFWNJ7+ZJ
 wW8+p0F7ouUUHpBCXBUJJyvpCbvW+wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-x7C4o9zANwWgQB1b1vy1gw-1; Fri, 07 Aug 2020 07:57:10 -0400
X-MC-Unique: x7C4o9zANwWgQB1b1vy1gw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85A3880BCB2;
 Fri,  7 Aug 2020 11:57:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC92F87A7A;
 Fri,  7 Aug 2020 11:57:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BEDD7B1A; Fri,  7 Aug 2020 13:57:04 +0200 (CEST)
Date: Fri, 7 Aug 2020 13:57:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xin He <hexin.op@bytedance.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in
 virtio_gpu_execbuffer_ioctl()
Message-ID: <20200807115704.4epnok7vxwdmemns@sirius.home.kraxel.org>
References: <20200721101647.42653-1-hexin.op@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721101647.42653-1-hexin.op@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, daniel@ffwll.ch,
 Muchun Song <songmuchun@bytedance.com>, Qi Liu <liuqi.16@bytedance.com>,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
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

On Tue, Jul 21, 2020 at 06:16:47PM +0800, Xin He wrote:
> From: Qi Liu <liuqi.16@bytedance.com>
> 
> We should put the reference count of the fence after calling
> virtio_gpu_cmd_submit(). So add the missing dma_fence_put().

>  	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
>  			      vfpriv->ctx_id, buflist, out_fence);
> +	dma_fence_put(&out_fence->f);
>  	virtio_gpu_notify(vgdev);

Pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
