Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8EA23ED6D
	for <lists.virtualization@lfdr.de>; Fri,  7 Aug 2020 14:43:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F1204873A4;
	Fri,  7 Aug 2020 12:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQQ0h4x5kz3s; Fri,  7 Aug 2020 12:43:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2FFF9873A3;
	Fri,  7 Aug 2020 12:43:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14FF0C004C;
	Fri,  7 Aug 2020 12:43:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13357C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 12:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DE193203E0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 12:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvdvlJjgoY+R
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 12:43:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 0317B203A4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596804195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=273fiZa3j2YUsHYvjEo3xvFBeJLIY7mZ32ur6GZf0EM=;
 b=QVwW8wIDIa1aK18bgE0wv6MXTdWGITG4t87itufgubLiU4N8nT5UlKy68dffxcZscFKngp
 6+SGR/SiO+K8nYE36PggEtI/DYrfkY8Nu3P5KDjFcJTgWIGUSiQC4N5pQ32JSJg+HX0Z7x
 nuJL5yKJF8u3O3h2hiVQpkImdRUWPwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-8ExUZS9hO7iDqC6bCcjDtg-1; Fri, 07 Aug 2020 08:43:14 -0400
X-MC-Unique: 8ExUZS9hO7iDqC6bCcjDtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 549B718A1DFB;
 Fri,  7 Aug 2020 12:43:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9E377B932;
 Fri,  7 Aug 2020 12:43:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 001E99CBC; Fri,  7 Aug 2020 14:43:10 +0200 (CEST)
Date: Fri, 7 Aug 2020 14:43:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xin He <hexin.op@bytedance.com>
Subject: Re: [PATCH] drm/virtio: fix memory leak in virtio_gpu_cleanup_object()
Message-ID: <20200807124310.cmhbj6bj76twdtaw@sirius.home.kraxel.org>
References: <20200722051851.72662-1-hexin.op@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722051851.72662-1-hexin.op@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 daniel@ffwll.ch, Qi Liu <liuqi.16@bytedance.com>
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

On Wed, Jul 22, 2020 at 01:18:51PM +0800, Xin He wrote:
> Before setting shmem->pages to NULL, kfree() should
> be called.

>  			sg_free_table(shmem->pages);
> +			kfree(shmem->pages);
>  			shmem->pages = NULL;

Pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
