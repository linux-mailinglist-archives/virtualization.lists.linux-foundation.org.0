Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FEB30DA91
	for <lists.virtualization@lfdr.de>; Wed,  3 Feb 2021 14:05:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 05409204F3;
	Wed,  3 Feb 2021 13:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YnXCqT9deHt; Wed,  3 Feb 2021 13:05:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D0D8020493;
	Wed,  3 Feb 2021 13:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADDA9C0174;
	Wed,  3 Feb 2021 13:05:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B0D4C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 13:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 572BE8650D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 13:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4G+NEnVeAOEQ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 13:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 78F9F864DF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 13:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612357499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZ/PnSF/Mht9gW5p6NbEzpwutRMrm7ZYBx9Q4GGL4MY=;
 b=DCe/mQwKoXE2BtPaagkecK5Gct6tcIIFxpdyVDtm1mNpN5Rn0hNzv7YstjminSSWiiiQIr
 zXqM3dJDld+OAdP4Nsn2QLlOo1uEJxES+SetUVT1MhkOFnbfkmapW6pw6AhGEC5xcTxnTg
 cq0Aw1Y9ZaT8YOtRxbWelYm7wuXwqKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-57E2bRiFNniJb7CUzZH3Gg-1; Wed, 03 Feb 2021 08:04:55 -0500
X-MC-Unique: 57E2bRiFNniJb7CUzZH3Gg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5D80BBEE4;
 Wed,  3 Feb 2021 13:04:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 650865D9E8;
 Wed,  3 Feb 2021 13:04:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2E517180063E; Wed,  3 Feb 2021 14:04:15 +0100 (CET)
Date: Wed, 3 Feb 2021 14:04:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] drm/qxl: properly free qxl releases
Message-ID: <20210203130415.rqokinkpy6ivixmu@sirius.home.kraxel.org>
References: <20210126165812.1661512-1-kraxel@redhat.com>
 <20210126165812.1661512-6-kraxel@redhat.com>
 <YBp3zQqomQziZbPT@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBp3zQqomQziZbPT@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

> > +	/*
> > +	 * Ask host to release resources (+fill release ring),
> > +	 * then wait for the release actually happening.
> > +	 */
> > +	qxl_io_notify_oom(qdev);
> > +	for (try = 0; try < 20 && atomic_read(&qdev->release_count) > 0; try++)
> > +		msleep(20);
> 
> A bit icky, why not use a wait queue or something like that instead of
> hand-rolling this? Not for perf reasons, just so it's a bit clear who
> waits for whom and why.

There isn't one ready for use, and adding a new one (to wait for the
garbage collection having released something) just for a clean shutdown
looked a bit like overkill.

But after digging a bit more and looking at the qxl_fence_wait() mess I
think adding a wait queue looks like a good idea ...

v5 coming soon ...

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
