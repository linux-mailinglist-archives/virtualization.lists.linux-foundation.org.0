Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639B15A47F
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 10:20:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6641920524;
	Wed, 12 Feb 2020 09:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AAQNN8W+KIe; Wed, 12 Feb 2020 09:20:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 346D8203BD;
	Wed, 12 Feb 2020 09:20:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C539C0177;
	Wed, 12 Feb 2020 09:20:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE85C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 09:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A382859E3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 09:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yEXtyXJHMZPy
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 09:20:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0FB78859D5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581499249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzmJbxskk6AlcHsD2V7eyusyF086fPjD2IYe+QvfO+A=;
 b=QBjSfRt62jDCOmdmZZDX/oGvknf8ensaGEC/CFjmqZ6dxIdSoOS6U0OUb+ZSQqnFkipAoc
 IeFG6Zlq/yFFwQQNRvIXNB71Od/5cJn2wtt2iPTqDKoOo3irW3bIxlDa3njIy5XyZTZiVf
 mv9gGze0hdHORYbpHCCqqiagqA8Lu1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-qLzioGbBOXmvZhndA3JKZQ-1; Wed, 12 Feb 2020 04:20:45 -0500
X-MC-Unique: qLzioGbBOXmvZhndA3JKZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF19107ACC9;
 Wed, 12 Feb 2020 09:20:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE63D1001281;
 Wed, 12 Feb 2020 09:20:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B751D9D6B; Wed, 12 Feb 2020 10:20:42 +0100 (CET)
Date: Wed, 12 Feb 2020 10:20:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] drm/bochs: add drm_driver.release callback.
Message-ID: <20200212092042.wnolwagpiucyw25m@sirius.home.kraxel.org>
References: <20200211135218.22871-1-kraxel@redhat.com>
 <20200211141956.GC2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211141956.GC2363188@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Tue, Feb 11, 2020 at 03:19:56PM +0100, Daniel Vetter wrote:
> On Tue, Feb 11, 2020 at 02:52:18PM +0100, Gerd Hoffmann wrote:
> > Call bochs_unload via drm_driver.release to make sure we release stuff
> > when it is safe to do so.  Use drm_dev_{enter,exit,unplug} to avoid
> > touching hardware after device removal.  Tidy up here and there.
> > 
> > v4: add changelog.
> > v3: use drm_dev_*().
> > v2: move hardware deinit to pci_remove().
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Btw I checked around whether there's anything else that obviously needs a
> drm_dev_enter/exit, and I spotted the !bochs->mmio check in
> bochs_hw_load_edid. That one looks like cargo-cult, there's a single
> caller in the init path, so either mmio works at that point or this is
> dead code ... slightly confusing.

FYI:  bochs->mmio actually can be NULL when running on very old qemu
versions, the mmio bar was added in qemu release 1.3.  All the register
access functions in bochs_hw.c have a fallback going to ioports because
of that.  So there is a reason for the check, even though it is highly
unlikely that mmio actually is NULL these days.  qemu 1.3 was released
in 2013 ...

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
