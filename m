Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 06930255959
	for <lists.virtualization@lfdr.de>; Fri, 28 Aug 2020 13:28:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55CE586E3F;
	Fri, 28 Aug 2020 11:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nchxAEqrenFu; Fri, 28 Aug 2020 11:28:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD96F86E3B;
	Fri, 28 Aug 2020 11:28:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82E4CC0051;
	Fri, 28 Aug 2020 11:28:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B05D7C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 11:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 97F6E880D0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 11:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEXCnbc+xc6o
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 11:28:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 97CBC880C8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598614086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vcVCnDfXCrpqdXroEZsRpzoOz05edQsOh2pIT4QY95E=;
 b=eTIvCxxGefDJyES3zOZs6wBueC4MxvW8KrfWWsL1QbFz6hHBg/euTArdWc6uaHAU8ucr7B
 kUf9L00cXvc0Xx7GPHHi7dZZy8YXWV0YPTgMB80sXNsYYE17l5VFCB7BYP1cixdZj7bfK6
 UOBTM6BgdQK8KhcN7LtMeUVLRbqS0kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-KhS13XkaMoyyK4EiseYxow-1; Fri, 28 Aug 2020 07:28:02 -0400
X-MC-Unique: KhS13XkaMoyyK4EiseYxow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43BEF64090;
 Fri, 28 Aug 2020 11:28:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCF325D9F3;
 Fri, 28 Aug 2020 11:28:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C877C9C87; Fri, 28 Aug 2020 13:27:59 +0200 (CEST)
Date: Fri, 28 Aug 2020 13:27:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 1/2] drm/virtio: fix unblank
Message-ID: <20200828112759.rmeeh5bonrewiqte@sirius.home.kraxel.org>
References: <20200818072511.6745-1-kraxel@redhat.com>
 <20200818072511.6745-2-kraxel@redhat.com>
 <88ae71c2-c3ed-e0e4-e62c-bdf9d6534f2a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88ae71c2-c3ed-e0e4-e62c-bdf9d6534f2a@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: David Airlie <airlied@linux.ie>, 1882851@bugs.launchpad.net,
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

On Mon, Aug 24, 2020 at 09:24:40AM +0200, Jiri Slaby wrote:
> On 18. 08. 20, 9:25, Gerd Hoffmann wrote:
> > When going through a disable/enable cycle without changing the
> > framebuffer the optimization added by commit 3954ff10e06e ("drm/virtio:
> > skip set_scanout if framebuffer didn't change") causes the screen stay
> > blank.  Add a bool to force an update to fix that.
> > 
> > v2: use drm_atomic_crtc_needs_modeset() (Daniel).
> > 
> > Cc: 1882851@bugs.launchpad.net
> > Fixes: 3954ff10e06e ("drm/virtio: skip set_scanout if framebuffer didn't change")
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Tested-by: Jiri Slaby <jirislaby@kernel.org>

Ping.  Need an ack or an review to merge this.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
