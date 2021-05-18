Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48D387620
	for <lists.virtualization@lfdr.de>; Tue, 18 May 2021 12:09:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC56400CD;
	Tue, 18 May 2021 10:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1jN9sVZWI16; Tue, 18 May 2021 10:09:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A37D40246;
	Tue, 18 May 2021 10:09:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECD1AC0001;
	Tue, 18 May 2021 10:09:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DACBFC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 10:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9829405DA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 10:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLIxeIvAkA_e
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 10:09:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E446405D9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r098tHE0nlpPy8H+tzPNv+PPdJXPs/G8lc3vpf4k9jM=;
 b=g9u0046UYJ+Z39qMOqgKV6Yva4f+VpzH08c+Gz8HpQIbDAs7C9RB93CGsr0UFSmFjmsmda
 xianPFbIepiYakmASE+k3unDZRIXP7JuNABiRtZ4QW1PRpxsUJs/JKucRcIXIZ0Dab28YG
 xPvBfI9Ym4h+UIiFYjBIFI9D4CGizn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-lX7iFzYyPlmd8sTiiq0pqw-1; Tue, 18 May 2021 06:09:30 -0400
X-MC-Unique: lX7iFzYyPlmd8sTiiq0pqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8BF802B78;
 Tue, 18 May 2021 10:09:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 663FC5D703;
 Tue, 18 May 2021 10:09:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBDEF180079B; Tue, 18 May 2021 12:09:25 +0200 (CEST)
Date: Tue, 18 May 2021 12:09:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 1/3] drm/virtio: Fixes a potential NULL pointer
 dereference on probe failure
Message-ID: <20210518100925.uvddw6y5ya4ddope@sirius.home.kraxel.org>
References: <20210517084913.403-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517084913.403-1-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org
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

On Mon, May 17, 2021 at 04:49:11PM +0800, Xie Yongji wrote:
> The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
> or virtio_gpu_init() failed. In this case, we should avoid the cleanup
> in virtio_gpu_release().

Pushed all three to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
