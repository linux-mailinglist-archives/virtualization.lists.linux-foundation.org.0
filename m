Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C2A127B6E
	for <lists.virtualization@lfdr.de>; Fri, 20 Dec 2019 14:01:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 83F21253A7;
	Fri, 20 Dec 2019 13:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEU2MXTMLZ58; Fri, 20 Dec 2019 13:01:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CB21125379;
	Fri, 20 Dec 2019 13:01:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7AA2C077D;
	Fri, 20 Dec 2019 13:01:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48F60C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 13:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 312D325379
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 13:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E26n+3cxvV50
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 13:00:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 48B46203CE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576846857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xeUreLt6va9L8SCH3nGSjnsigirIJ1dymwMuYGQ0eIA=;
 b=djKWhJkbMSfGNaeRnks05R60oB1kbRCP1G8BKK012mqeYbEDD7oCToV9hBKnkYQ4aSlOdI
 cBpuchUWu0cUe/SzsujR+zQIWVz1kILQ8FKtgeE6MQ0mFiAyDgiJ+d0yeLIQE/uJHnzaF6
 glJwsujHUqw25JaTF/F8QfP1Hk81MRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-x_iIbmquNkeT2-BPzY-dDA-1; Fri, 20 Dec 2019 08:00:45 -0500
X-MC-Unique: x_iIbmquNkeT2-BPzY-dDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF8728024DB;
 Fri, 20 Dec 2019 13:00:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B59CE70383;
 Fri, 20 Dec 2019 13:00:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 638F69DA5; Fri, 20 Dec 2019 14:00:25 +0100 (CET)
Date: Fri, 20 Dec 2019 14:00:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Frediano Ziglio <fziglio@redhat.com>
Subject: Re: [Spice-devel] [PATCH 4/4] drm/qxl: add drm_driver.release
 callback.
Message-ID: <20191220130025.maasx7xfb7rtadgd@sirius.home.kraxel.org>
References: <20191220115935.15152-1-kraxel@redhat.com>
 <20191220115935.15152-5-kraxel@redhat.com>
 <57755373.16738363.1576843760950.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57755373.16738363.1576843760950.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
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

On Fri, Dec 20, 2019 at 07:09:20AM -0500, Frediano Ziglio wrote:
> > 
> > Move final cleanups to qxl_drm_release() callback.
> 
> Can you explain in the commit why this is better or preferable?

It gets called when the drm device refcount goes down to zero.
It's needed for a proper cleanup in the correct order.

> > Add drm_atomic_helper_shutdown() call to qxl_pci_remove().
> 
> I suppose this is to replace the former manual cleanup calls,
> which were moved to qxl_drm_release, I think this could be
> added in the commit message ("why"), I don't see much value
> in describing "how" this was done.

The call is part of the shutdown sequence for atomic drm drivers
and wasn't present in qxl for some reason.

> > Reorder calls in qxl_device_fini().  Cleaning up gem & ttm
> > might trigger qxl commands, so we should do that before
> > releaseing command rings.
> 
> Typo: releaseing -> releasing
> Why not putting this in a separate commit? Was this behaviour
> changed? It does not seem so to me.

Yes, I can make that a separate commit.

No, behavior didn't change.  qxl_device_fini() is simply broken
without this.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
