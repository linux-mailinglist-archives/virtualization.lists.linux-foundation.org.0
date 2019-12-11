Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D611A5B2
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 09:15:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B9C9B2051B;
	Wed, 11 Dec 2019 08:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBATz0NRnJu0; Wed, 11 Dec 2019 08:15:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0F8B4204F0;
	Wed, 11 Dec 2019 08:15:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE654C0881;
	Wed, 11 Dec 2019 08:15:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66D3CC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5CFCE8843F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgQY9Wbl9MOz
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:15:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 69E1A88468
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576052151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9+eXVJvGhvjgCko5lAbFcvBiKAk1D5Fec1eKLqFyyY=;
 b=X4MIt5JXhAxwKR7f/hOhmMNlbr31Ylg9flFRNM4W5EFOL9YE0cgEmeZVLwCUItwivNvRVG
 IT4+3wowjwaY17FBbecHweqVGshdx2XZESu6yIUMpvtfEkxRiv7Nv6GpVx2h77x2TnmCjV
 8g9N80DHFIBdOcYkv6iIJQLjl7FByYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-wgVuXbNjO-abuQ7falBagA-1; Wed, 11 Dec 2019 03:15:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0942E911EA;
 Wed, 11 Dec 2019 08:15:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DEB160BE1;
 Wed, 11 Dec 2019 08:15:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB48E16E05; Wed, 11 Dec 2019 09:15:41 +0100 (CET)
Date: Wed, 11 Dec 2019 09:15:41 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/virtio: fix mmap page attributes
Message-ID: <20191211081541.ejofg4uxo6poss6v@sirius.home.kraxel.org>
References: <20191210085759.14763-1-kraxel@redhat.com>
 <e8915378-df67-e6f4-f40c-599797e16e9c@suse.de>
MIME-Version: 1.0
In-Reply-To: <e8915378-df67-e6f4-f40c-599797e16e9c@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wgVuXbNjO-abuQ7falBagA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, gurchetansingh@chromium.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

> There's similar code in udl, [1] which still uses writecombine for
> imported buffers. Virtio does not need this?

virtio doesn't support dma-buf imports (yet).
So no worries for now.

Why pick writecombine for the imported buffer btw?
It'll probably be correct for the majority of imports, but it still
looks like a educated guess to me.  What if you import from vgem?

I guess we should either ...
  (1) Ask the exporting driver to handle things, simliar to how it is
      done for vmaps already, probably by calling dma_buf_mmap(), or
  (2) Refuse to mmap imported objects via drm api.

> Aside from this, do you think we could handle all special cases within
> shmem?

Probably makes sense to teach shmem helpers about caching.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
